import Day1
import Day2
import Day3
import Day4
import Foundation
import Solutions

struct ProblemStrategy {
    func select(day: Int, with input: String) throws -> Day {
        switch day {
        case 1:
            return DayOne(input: input)
        case 2:
            return DayTwo(input: input)
        case 3:
            return DayThree(input: input)
        case 4:
            return DayFour(input: input)
        default:
            throw ProblemStrategyError.solutionNotFound(day: day)
        }
    }
}

enum ProblemStrategyError: LocalizedError {
    case solutionNotFound(day: Int)
    
    var errorDescription: String? {
        switch self {
        case .solutionNotFound(let day):
            return "There is no solution for Day \(day) yet."
        }
    }
}
