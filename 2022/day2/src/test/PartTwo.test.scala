package day2

import PartTwo.*
import RockPaperScissors.*
import scala.util.{Success, Failure}

class PartTwoTests extends munit.FunSuite:

    test("play example") {
        val result = play("example.txt")
        val expected = Success(12)
        assert(result == expected)
    }

end PartTwoTests