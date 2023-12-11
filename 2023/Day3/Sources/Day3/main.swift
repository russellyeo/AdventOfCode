import Solution
import Parsing

do {
    var rawInput = challenge[...]
    let grid = try PuzzleInput().parse(&rawInput)
    let schematic = EngineSchematic(grid: grid)
    let partOne = schematic.sumOfValidPartNumbers()
    let partTwo = schematic.sumOfGearRatios()
    print("Answer (Part One): \(partOne)")
    print("Answer (Part Two): \(partTwo)")
} catch {
    print("Error: \(error)")
}

