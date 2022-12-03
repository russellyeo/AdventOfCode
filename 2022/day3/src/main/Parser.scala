package day3

import scala.io.Source
import scala.util.{Try, Using}

object Parser {

    def parse(filename: String): Try[List[(String, String)]] = 
        Using(Source.fromResource(filename)) { bufferedSource =>
            bufferedSource.getLines.toList map split
        }

    def split(line: String): (String, String) = 
        line.splitAt(line.length / 2)

}