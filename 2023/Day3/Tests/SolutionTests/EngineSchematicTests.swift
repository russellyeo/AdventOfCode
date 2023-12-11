import CustomDump
@testable import Solution
import XCTest

final class EngineSchematicTests: XCTestCase {
    
    // MARK: PART ONE
    
    func test_PartOne_PuzzleExample() throws {
        let example = """
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
        """
        var input = example[...]
        let grid = try PuzzleInput().parse(&input)
        let schematic = EngineSchematic(grid: grid)
        let answer = schematic.sumOfValidPartNumbers()
        XCTAssertEqual(answer, 4361)
    }
    
    /// Example grid from [reddit post](https://www.reddit.com/r/adventofcode/comments/189q9wv/2023_day_3_another_sample_grid_to_use/)
    func test_PartOne_RedditExample() throws {
        // Number with no surrounding symbol
        // Number with symbol before and after on same line
        // Number with symbol vertically above and below
        // Number with diagonal symbol in all 4 possible diagonals
        // Possible gear with 1, 2, 3 and 4 surrounding numbers
        // Gear with different numbers
        // Gear with same numbers
        // Non gear with 2 unique surrounding numbers
        // Number at beginning/end of line
        // Number at beginning/end of grid
        // Numbers need to have a symbol adjacent to be a valid part, not another number
        // Single digit numbers at the end of a row can be valid parts
        let example = """
        12.......*..
        +.........34
        .......-12..
        ..78........
        ..*....60...
        78.........9
        .5.....23..$
        8...90*12...
        ............
        2.2......12.
        .*.........*
        1.1..503+.56
        """
        var input = example[...]
        let grid = try PuzzleInput().parse(&input)
        let schematic = EngineSchematic(grid: grid)
        let answer = schematic.sumOfValidPartNumbers()
        XCTAssertEqual(answer, 925)
    }
    
    // MARK: PART TWO
    
    func test_PartTwo_PuzzleExample() throws {
        let example = """
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
        """
        var input = example[...]
        let grid = try PuzzleInput().parse(&input)
        let schematic = EngineSchematic(grid: grid)
        let answer = schematic.sumOfGearRatios()
        XCTAssertEqual(answer, 467835)
    }
    
    func test_PartTwo_RedditExample() throws {
        let example = """
        12.......*..
        +.........34
        .......-12..
        ..78........
        ..*....60...
        78.........9
        .5.....23..$
        8...90*12...
        ............
        2.2......12.
        .*.........*
        1.1..503+.56
        """
        var input = example[...]
        let grid = try PuzzleInput().parse(&input)
        let schematic = EngineSchematic(grid: grid)
        let answer = schematic.sumOfGearRatios()
        XCTAssertEqual(answer, 6756)
    }
    
}



