@testable import Solution
import XCTest

final class SolutionTests: XCTestCase {
    func testExample() throws {
        let input = """
        1abc2
        pqr3stu8vwx
        a1b2c3d4e5f
        treb7uchet
        """
        let output = Puzzle().solve(for: input)
        XCTAssertEqual(output, 142)
    }
}
