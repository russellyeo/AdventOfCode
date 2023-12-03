import CustomDump
@testable import Solution
import Parsing
import XCTest

final class PuzzleInputTests: XCTestCase {
    func testParsing() throws {
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
        let output = try PuzzleInput().parse(&input)
        let expected: PuzzleInput.Grid = .init(value: [
            [.integer(4), .integer(6), .integer(7), .empty, .empty, .integer(1), .integer(1), .integer(4), .empty, .empty],
            [.empty, .empty, .empty, .symbol("*"), .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .integer(3), .integer(5), .empty, .empty, .integer(6), .integer(3), .integer(3), .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .symbol("#"), .empty, .empty, .empty],
            [.integer(6), .integer(1), .integer(7), .symbol("*"), .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .symbol("+"), .empty, .integer(5), .integer(8), .empty],
            [.empty, .empty, .integer(5), .integer(9), .integer(2), .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .integer(7), .integer(5), .integer(5), .empty],
            [.empty, .empty, .empty, .symbol("$"), .empty, .symbol("*"), .empty, .empty, .empty, .empty],
            [.empty, .integer(6), .integer(6), .integer(4), .empty, .integer(5), .integer(9), .integer(8), .empty, .empty]
        ])
        XCTAssertNoDifference(output.value[0], expected.value[0])
        XCTAssertNoDifference(output.value[1], expected.value[1])
        XCTAssertNoDifference(output.value[2], expected.value[2])
        XCTAssertNoDifference(output.value[3], expected.value[3])
        XCTAssertNoDifference(output.value[4], expected.value[4])
        XCTAssertNoDifference(output.value[5], expected.value[5])
        XCTAssertNoDifference(output.value[6], expected.value[6])
        XCTAssertNoDifference(output.value[7], expected.value[7])
        XCTAssertNoDifference(output.value[8], expected.value[8])
        XCTAssertNoDifference(output.value[9], expected.value[9])
    }
    
    func testPrinting() throws {
        let grid: PuzzleInput.Grid = .init(value: [
            [.integer(4), .integer(6), .integer(7), .empty, .empty, .integer(1), .integer(1), .integer(4), .empty, .empty],
            [.empty, .empty, .empty, .symbol("*"), .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .integer(3), .integer(5), .empty, .empty, .integer(6), .integer(3), .integer(3), .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .symbol("#"), .empty, .empty, .empty],
            [.integer(6), .integer(1), .integer(7), .symbol("*"), .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .symbol("+"), .empty, .integer(5), .integer(8), .empty],
            [.empty, .empty, .integer(5), .integer(9), .integer(2), .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .integer(7), .integer(5), .integer(5), .empty],
            [.empty, .empty, .empty, .symbol("$"), .empty, .symbol("*"), .empty, .empty, .empty, .empty],
            [.empty, .integer(6), .integer(6), .integer(4), .empty, .integer(5), .integer(9), .integer(8), .empty, .empty]
        ])
        let parser = PuzzleInput()
        let expected = """
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
        """[...]
        XCTAssertNoDifference(try parser.print(grid), expected)
    }
    
}
