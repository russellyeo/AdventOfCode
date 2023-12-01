@testable import Solution
import XCTest

final class SolutionTests: XCTestCase {
    func testParsing() throws {
        let example = """
        30373
        25512
        65332
        33549
        35390
        """
        var input = example[...]
        let output = try PuzzleInput().parse(&input)
        let expected: [[Int]] = [
            [3, 0, 3, 7, 3],
            [2, 5, 5, 1, 2],
            [6, 5, 3, 3, 2],
            [3, 3, 5, 4, 9],
            [3, 5, 3, 9, 0]
        ]
        XCTAssertEqual(output, expected)
    }
}

