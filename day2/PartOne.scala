//> using scala "3"
package day2

import scala.util.{Try, Success, Failure}

object PartOne {
    import StrategyGuideParser.*
    import RockPaperScissors.*
    
    def play(filename: String): Try[Int] =
        val maybeStrategyGuide: Try[List[(String, String)]] = strategyGuideFromFile(filename)
        maybeStrategyGuide.flatMap(x => playWithStrategyGuide(x))

    def playWithStrategyGuide(strategyGuide: List[(String, String)]): Try[Int] =
        val maybeResults = strategyGuide.map { 
            case (opponent, me) => playRound(opponent, me) 
        }
        val flatMaybeResults = Try(maybeResults.map(_.get))
        flatMaybeResults.map(x => x.sum)

    def playRound(opponent: String, me: String): Try[Int] =
        for
            opponentSign <- decryptSign(opponent)
            meSign <- decryptSign(me)
        yield
            getRoundScore(getRoundResult(opponentSign, meSign)) + getSignScore(meSign)

    def getRoundResult(opponent: Sign, me: Sign): Result =
        if (getSignScore(opponent) % 3) + 1 == getSignScore(me) then
            return Result.Win
        else if getSignScore(opponent) == getSignScore(me) then
            return Result.Draw
        else
            return Result.Lose
    
    def decryptSign(letter: String): Try[Sign] =
        letter match
            case "A" | "X" => Success(Sign.Rock)
            case "B" | "Y" => Success(Sign.Paper)
            case "C" | "Z" => Success(Sign.Scissors)
            case _ => Failure(new java.lang.IllegalArgumentException)
}

// Run me with this command:
// scala-cli run . --main-class day2.partOneApp
@main
def partOneApp =
    import PartOne.*
    
    play("input.txt") match
        case Success(total) => println(s"Your total is: $total")
        case Failure(error) => println(s"Failed: msg = ${error.getMessage}")
    