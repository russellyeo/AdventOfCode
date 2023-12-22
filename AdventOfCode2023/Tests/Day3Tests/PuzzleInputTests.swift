@testable import Day3
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
        let expected = Grid.example
        XCTAssertEqual(output, expected)
    }
}
