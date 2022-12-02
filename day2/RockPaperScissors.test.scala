//> using scala "3"
//> using lib "org.scalameta::munit::0.7.29"
package day2

import RockPaperScissors.*
import StrategyGuideParser.*
import scala.util.{Success, Failure}

// Run me with this command:
// scala-cli test .

class RockPaperScissorsTests extends munit.FunSuite:

    test("parse example") {
        val result = strategyGuideFromFile("example.txt")
        val expected = Success(Map[String, String](
            "A" -> "Y",
            "B" -> "X",
            "C" -> "Z"
        ))
        assert(result == expected)
    }

end RockPaperScissorsTests