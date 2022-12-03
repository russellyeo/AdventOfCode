package day3

import scala.util.{ Try, Using }
import scala.io.Source

object PartTwo { 

    def solve(filename: String): Int = 
        val rucksacks = readLines(filename).get
        val groups = rucksacks.grouped(3)
        
        val totals = groups.zipWithIndex.map { (group, index) =>
            val rucksackA = group(0)
            val rucksackB = group(1)
            val rucksackC = group(2)
            val common = findCommonCharacter(rucksackA, rucksackB, rucksackC)
            val value = priorityValue(common)
            println(s"Group $index: common character: $common, value: $value")
            value
        }
        totals.sum
    
    def findCommonCharacter(a: String, b: String, c: String): Char =
        val common = a intersect b intersect c
        common.head

    def priorityValue(character: Char): Int =
        val characters = ('a' to 'z') ++ ('A' to 'Z')
        characters.indexOf(character) + 1

    def readLines(filename: String): Try[List[String]] = 
        Using(Source.fromResource(filename)) { bufferedSource =>
            bufferedSource.getLines.toList
        }

}

@main
def partTwoApp =
    import PartTwo.*
    val answer = solve("input.txt")
    println(s"The answer is $answer")

    