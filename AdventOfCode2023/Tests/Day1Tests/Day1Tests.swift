@testable import Day1
import XCTest

final class SolutionTests: XCTestCase {
    func testPartOneExample() throws {
        let input = """
        1abc2
        pqr3stu8vwx
        a1b2c3d4e5f
        treb7uchet
        """
        let output = PartOne().solve(for: input)
        XCTAssertEqual(output, 142)
    }
    
    func testPartTwoExample() throws {
        let input = """
        two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightseven2
        zoneight234
        7pqrstsixteen
        """
        let output = PartTwo().solve(for: input)
        XCTAssertEqual(output, 281)
    }
}
