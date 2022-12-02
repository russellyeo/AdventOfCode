//> using scala "3"
package day2

import scala.util.Try

object RockPaperScissors {
    import StrategyGuideParser.*
    
    def play(filename: String): Unit = ???
        
}

object StrategyGuideParser {
    import scala.io.Source
    import scala.util.Using

    def strategyGuideFromFile(filename: String): Try[Map[String, String]] = 
        val maybeLines: Try[List[String]] = readLinesFromFile(filename)
        maybeLines.map(doc => strategyGuide(doc))

    private def readLinesFromFile(filename: String): Try[List[String]] = 
        Using(io.Source.fromFile(filename)) { bufferedSource =>
            bufferedSource.getLines.toList
        }

    private def strategyGuide(lines: List[String]): Map[String, String] = 
        val column1 = lines.map(x => x.take(1))
        val column2 = lines.map(x => x.takeRight(1))
        (column1 zip column2).toMap
}

// Run me with this command:
// scala-cli run .
@main
def rockPaperScissorsApp =
    import RockPaperScissors.*
    println("Hello, World!")