//> using scala "3"
//> using lib "org.scalameta::munit::0.7.29"
package day2

import PartOne.*
import RockPaperScissors.*
import scala.util.{Success, Failure}

class PartOneTests extends munit.FunSuite:

    test("play example") {
        val result = play("example.txt")
        val expected = Success(15)
        assert(result == expected)
    }

    // getRoundResult

    test("getRoundResult - rock beats scissors") {
        val result = getRoundResult(Sign.Scissors, Sign.Rock)
        val expected = Result.Win
        assert(result == expected)
    }

    test("getRoundResult - rock draws with rock") {
        val result = getRoundResult(Sign.Rock, Sign.Rock)
        val expected = Result.Draw
        assert(result == expected)
    }

    test("getRoundResult - rock loses to paper") {
        val result = getRoundResult(Sign.Paper, Sign.Rock)
        val expected = Result.Lose
        assert(result == expected)
    }

    test("getRoundResult - paper beats rock") {
        val result = getRoundResult(Sign.Rock, Sign.Paper)
        val expected = Result.Win
        assert(result == expected)
    }

    test("getRoundResult - paper draws with paper") {
        val result = getRoundResult(Sign.Paper, Sign.Paper)
        val expected = Result.Draw
        assert(result == expected)
    }

    test("getRoundResult - paper loses to scissors") {
        val result = getRoundResult(Sign.Scissors, Sign.Paper)
        val expected = Result.Lose
        assert(result == expected)
    }

    test("getRoundResult - scissors beats paper") {
        val result = getRoundResult(Sign.Paper, Sign.Scissors)
        val expected = Result.Win
        assert(result == expected)
    }

    test("getRoundResult - scissors draws with scissors") {
        val result = getRoundResult(Sign.Scissors, Sign.Scissors)
        val expected = Result.Draw
        assert(result == expected)
    }

    test("getRoundResult - scissors loses to rock") {
        val result = getRoundResult(Sign.Rock, Sign.Scissors)
        val expected = Result.Lose
        assert(result == expected)
    }

    // getRoundResult

    test("playRound - A vs X") {
        assert(playRound("A", "X") == Success(4))       
    }

    test("playRound - A vs Y") {
        assert(playRound("A", "Y") == Success(8))       
    }

    test("playRound - A vs Z") {
        assert(playRound("A", "Z") == Success(3))       
    }

    test("playRound - B vs X") {
        assert(playRound("B", "X") == Success(1))
    }

    test("playRound - B vs Y") {
        assert(playRound("B", "Y") == Success(5))
    }

    test("playRound - B vs Z") {
        assert(playRound("B", "Z") == Success(9))
    }

    test("playRound - C vs X") {
        assert(playRound("C", "X") == Success(7))
    }

    test("playRound - C vs Y") {
        assert(playRound("C", "Y") == Success(2))
    }

    test("playRound - C vs Z") {
        assert(playRound("C", "Z") == Success(6))
    }

end PartOneTests