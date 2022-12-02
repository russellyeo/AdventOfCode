//> using scala "3"
package day2

import scala.util.{Try, Success, Failure}
import scala.collection.IterableOps

object RockPaperScissors {
    import StrategyGuideParser.*

    enum Sign:
        case Rock, Paper, Scissors

    enum Result:
        case Win, Draw, Lose
    
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

    def getRoundScore(result: Result): Int =
        result match
            case Result.Win => 6
            case Result.Draw => 3
            case Result.Lose => 0
        
    def getSignScore(sign: Sign): Int = 
        sign match
            case Sign.Rock => 1
            case Sign.Paper => 2
            case Sign.Scissors => 3
    
    def decryptSign(letter: String): Try[Sign] =
        letter match
            case "A" | "X" => Success(Sign.Rock)
            case "B" | "Y" => Success(Sign.Paper)
            case "C" | "Z" => Success(Sign.Scissors)
            case _ => Failure(new java.lang.IllegalArgumentException)
}

object StrategyGuideParser {
    import scala.io.Source
    import scala.util.Using

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

// Run me with this command:
// scala-cli run .
@main
def rockPaperScissorsApp =
    import RockPaperScissors.*
    
    play("input.txt") match
        case Success(total) => println(s"Your total is: $total")
        case Failure(error) => println(s"Failed: msg = ${error.getMessage}")
    