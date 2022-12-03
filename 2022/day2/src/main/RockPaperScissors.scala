package day2

object RockPaperScissors {
    enum Sign:
        case Rock, Paper, Scissors

    enum Result:
        case Win, Draw, Lose

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
}