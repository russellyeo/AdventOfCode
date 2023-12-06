import Solution
import Parsing

do {
    var rawInput = challenge[...]
    let grid = try PuzzleInput().parse(&rawInput)
    let schematic = EngineSchematic(grid: grid)
    let partOne = schematic.sumOfValidPartNumbers()
    print("Answer (Part One): \(partOne)") // 528231 is the wrong answer
//    print("Answer (Part Two): \(partTwo)")
} catch {
    print("Error: \(error)")
}

