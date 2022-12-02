//> using scala "3"
package day2

import scala.io.Source
import scala.util.{Try, Using}

object StrategyGuideParser {

    def strategyGuideFromFile(filename: String): Try[List[(String, String)]] = 
        val maybeLines: Try[List[String]] = readLinesFromFile(filename)
        maybeLines.map(lines => strategyGuide(lines))

    def readLinesFromFile(filename: String): Try[List[String]] = 
        Using(io.Source.fromFile(filename)) { bufferedSource =>
            bufferedSource.getLines.toList
        }

    def strategyGuide(lines: List[String]): List[(String, String)] = 
        lines.map(x => (x.take(1), x.takeRight(1)))

}