package day2

import StrategyGuideParser.*
import scala.util.{Success, Failure}

class StrategyGuideParserTests extends munit.FunSuite:

    test("parse example") {
        val result = strategyGuideFromFile("example.txt")
        val expected = Success(List[(String, String)](
            ("A", "Y"),
            ("B", "X"),
            ("C", "Z")
        ))
        assert(result == expected)
    }

end StrategyGuideParserTests