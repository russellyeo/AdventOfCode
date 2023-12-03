import Solution
import Parsing

do {
    var rawInput = example[...]
    let parser = PuzzleInput()
    let puzzleInput = try parser.parse(&rawInput)
    let printBack = try parser.print(puzzleInput)

    print("Puzzle Input:\n\(printBack)")
//    print("Answer (Part One): \(partOne)")
//    print("Answer (Part Two): \(partTwo)")
} catch {
    print("Error: \(error)")
}

