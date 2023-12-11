import Solution
import Parsing

do {
    var rawInput = challenge[...]
    let scratchcards: Scratchcards = try PuzzleInput().parse(&rawInput)
    let partOne = scratchcards.calculateScore()
    print("Answer (Part One): \(partOne)")
//    print("Answer (Part Two): \(partTwo)")
} catch {
    print("Error: \(error)")
}

