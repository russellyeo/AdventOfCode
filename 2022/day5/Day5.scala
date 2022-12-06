//> using scala "3"
//> using lib "org.scalatest::scalatest::3.2.14"
//> using resourceDir "input"

import scala.collection.mutable.Stack
import scala.io.Source
import scala.util.{Try, Using}
import scala.collection.mutable.ArrayBuffer

object Day5 {

    case class Action(count: Int, from: Int, to: Int)
    
    def solve(filename: String, crates: List[List[Char]]): List[Char] =
        load(filename)
            .map(parse)
            .foldLeft(crates)(move)
            .map(_.head)

    def load(filename: String): List[String] =
        Using(Source.fromResource(filename))(bs => bs.getLines.toList).get

    def parse(input: String): Action =
        val numbers = ("\\d+".r).findAllIn(input).map(_.toInt).toList
        Action(numbers(0), numbers(1), numbers(2))

    def move(crates: List[List[Char]], action: Action): List[List[Char]] =
        for 
            index <- crates.indices.toList
            (fromIndex, toIndex) = (action.from - 1, action.to - 1)
        yield index match 
            case `fromIndex` => crates(fromIndex).drop(action.count)
            case `toIndex` => crates(fromIndex).take(action.count).reverse ++ crates(toIndex)
            case _ => crates(index)

}

object StartingPosition {

    //     [D]    
    // [N] [C]    
    // [Z] [M] [P]
    //  1   2   3 
    val example = List(
        List('N', 'Z'),
        List('D', 'C', 'M'),
        List('P')
    )

    //         [M]     [B]             [N]
    // [T]     [H]     [V] [Q]         [H]
    // [Q]     [N]     [H] [W] [T]     [Q]
    // [V]     [P] [F] [Q] [P] [C]     [R]
    // [C]     [D] [T] [N] [N] [L] [S] [J]
    // [D] [V] [W] [R] [M] [G] [R] [N] [D]
    // [S] [F] [Q] [Q] [F] [F] [F] [Z] [S]
    // [N] [M] [F] [D] [R] [C] [W] [T] [M]
    //  1   2   3   4   5   6   7   8   9
    val challenge = List(
        List('T', 'Q', 'V', 'C', 'D', 'S', 'N'),
        List('V', 'F', 'M'),
        List('M', 'H', 'N', 'P', 'D', 'W', 'Q', 'F'),
        List('F', 'T', 'R', 'Q', 'D'),
        List('B', 'V', 'H', 'Q', 'N', 'M', 'F', 'R'),
        List('Q', 'W', 'P', 'N', 'G', 'F', 'C'),
        List('T', 'C', 'L', 'R', 'F', 'W'),
        List('S', 'N', 'Z', 'T'),
        List('N', 'H', 'Q', 'R', 'J', 'D', 'S', 'M')
    )

}

@main
def app =
    import Day5.*
    import StartingPosition.*
    val answer = solve("challenge.txt", challenge)
    println(s"Answer: ${answer.mkString("")}")