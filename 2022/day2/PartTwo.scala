//> using scala "3"
package day2

import scala.util.{Try, Success, Failure}

object PartTwo {
    import StrategyGuideParser.*
    import RockPaperScissors.*
    
    def play(filename: String): Try[Int] =
        val maybeStrategyGuide: Try[List[(String, String)]] = strategyGuideFromFile(filename)
        maybeStrategyGuide.flatMap(x => playWithStrategyGuide(x))

    def playWithStrategyGuide(strategyGuide: List[(String, String)]): Try[Int] =
        val maybeResults = strategyGuide.map { 
            case (opponent, result) => playRound(opponent, result) 
        }
        val flatMaybeResults = Try(maybeResults.map(_.get))
        flatMaybeResults.map(x => x.sum)

    def playRound(opponent: String, result: String): Try[Int] =
        for
            opponentSign <- decryptSign(opponent)
            desiredResult <- decryptResult(result)
            mySign <- chooseSign(opponentSign, desiredResult)
            mySignScore = getSignScore(mySign)
            roundResult = getRoundResult(opponentSign, mySign)
            roundScore = getRoundScore(roundResult)
        yield
            roundScore + mySignScore

    def chooseSign(opponentSign: Sign, desiredResult: Result): Try[Sign] = 
        if desiredResult == Result.Draw then
            Success(opponentSign)
        else if opponentSign == Sign.Rock && desiredResult == Result.Win then
            Success(Sign.Paper)
        else if opponentSign == Sign.Rock && desiredResult == Result.Lose then
            Success(Sign.Scissors)
        else if opponentSign == Sign.Paper && desiredResult == Result.Win then
            Success(Sign.Scissors)
        else if opponentSign == Sign.Paper && desiredResult == Result.Lose then
            Success(Sign.Rock)
        else if opponentSign == Sign.Scissors && desiredResult == Result.Win then
            Success(Sign.Rock)
        else if opponentSign == Sign.Scissors && desiredResult == Result.Lose then
            Success(Sign.Paper)
        else 
            Failure(new java.lang.IllegalArgumentException)

    def getRoundResult(opponent: Sign, me: Sign): Result =
        if (getSignScore(opponent) % 3) + 1 == getSignScore(me) then
            return Result.Win
        else if getSignScore(opponent) == getSignScore(me) then
            return Result.Draw
        else
            return Result.Lose
    
    def decryptSign(letter: String): Try[Sign] =
        letter match
            case "A" => Success(Sign.Rock)
            case "B" => Success(Sign.Paper)
            case "C" => Success(Sign.Scissors)
            case _ => Failure(new java.lang.IllegalArgumentException)

    def decryptResult(letter: String): Try[Result] =
        letter match
            case "X" => Success(Result.Lose)
            case "Y" => Success(Result.Draw)
            case "Z" => Success(Result.Win)
            case _ => Failure(new java.lang.IllegalArgumentException)
}

// Run me with this command:
// scala-cli run . --main-class day2.partOneApp
@main
def partTwoApp =
    import PartTwo.*
    
    play("input.txt") match
        case Success(total) => println(s"Your total is: $total")
        case Failure(error) => println(s"Failed: msg = ${error.getMessage}")
    