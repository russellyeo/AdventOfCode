//> using scala "3"
//> using lib "org.scalatest::scalatest::3.2.14"
//> using resourceDir "input"

import scala.io.Source
import scala.util.{Try, Using}
import scala.util.chaining._

object Day5 {

    case class Action(count: Int, from: Int, to: Int)
    case class Input(crates: List[List[Char]], actions: List[Action])
    case class Output(part1: String, part2: String)
    
    /** 
     * Parse a given file and find the answer 
     * 
     * - Load the file
     * - Parse the file into the challenge input
     * - Process the input, moving multiple crates in order for part 2
     * */
    def solve(filename: String): Output =
        load(filename).pipe(parse).pipe { input => 
            Output(
                process(input, moveInOrder = false),
                process(input, moveInOrder = true)
            )
        }
    
    /** Load a list of strings from the file */
    def load(filename: String): List[String] =
        Using(Source.fromResource(filename))(bs => bs.getLines.toList).get

     /** 
      * Process the input
      * 
      * - Apply the actions on the crates
      * - Return the top crate from each stack (joined as a string)
      * */
    def process(input: Input, moveInOrder: Boolean): String =
        input
            .pipe(input => apply(input, moveInOrder))
            .map(_.head)
            .mkString("")

    /** Move the crates according to the actions */
    def apply(input: Input, moveInOrder: Boolean): List[List[Char]] =
        input.actions.foldLeft(input.crates)((crates, action) => move(crates, action, moveInOrder))

    /** 
     * Parse a list of strings into the challenge input 
     * 
     * - Split the list of strings into crates and actions (by finding the first empty line)
     * - Clean up the input (drop the stack numebrs and the empty line)
     * - Parse the crates and actions into the challenge input
     * */
    def parse(lines: List[String]): Input = 
        lines
            .span(_.trim.nonEmpty)
            .pipe((crates, actions) => (crates.dropRight(1), actions.drop(1)))
            .pipe((crates, actions) => Input(parseCrates(crates), parseActions(actions)))

    /** 
     * Parse the crates from a list of strings
     * 
     * - Transpose the list of strings (rotate the crates 90 degrees)
     * - Filter by letters
     * - Remove empty strings
     * - Convert to a list
     * */
    def parseCrates(lines: List[String]): List[List[Char]] =
        lines
            .transpose
            .map(_.filter(_.isLetter))
            .filterNot(_.isEmpty)
            .toList

    /** 
     * Parse the actions from a list of strings
     * 
     * - Use regex to find the numbers in each string
     * - Convert to a list of integers
     * - Convert to an Action
     * */
    def parseActions(lines: List[String]): List[Action] =
        lines
            .map(line => ("\\d+".r).findAllIn(line))
            .map(_.toList.map(_.toInt))
            .collect { case List(count, from, to) => Action(count, from, to) }

    /** 
     * Apply an action to a list of stacks of crates
     * 
     * Iterate over the stacks of crates, and:
     * - If it is the 'from' stack, remove the top n crates
     * - If it is the 'to' stack, add the top n crates from the 'from' stack (in order if needed or reverse order if not)
     * - Otherwise, leave the stack unchanged
     * */
    def move(crates: List[List[Char]], action: Action, moveInOrder: Boolean): List[List[Char]] =
        for 
            index <- crates.indices.toList
            (fromIndex, toIndex) = (action.from - 1, action.to - 1)
        yield index match 
            case `fromIndex` => 
                crates(fromIndex).drop(action.count)
            case `toIndex` => 
                crates(fromIndex).take(action.count).pipe(moving => if moveInOrder then moving else moving.reverse) ++ crates(toIndex)
            case _ =>
                crates(index)

}

@main
def app =
    import Day5.*
    val answer = solve("challenge.txt")
    println(s"Part 1: ${answer._1}")
    println(s"Part 2: ${answer._2}")