@testable import Solution
import XCTest

// Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
// Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
// Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
// Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
// Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green

final class SolutionTests: XCTestCase {
    
    func testColourCountParser() throws {
        var input = "3 blue"[...]
        let output = try ColourCountParser().parse(&input)
        XCTAssertEqual(output.0, 3)
        XCTAssertEqual(output.1, .blue)
    }
    
    func testHandParser() throws {
        var input = "3 blue, 4 red"[...]
        let output = try HandParser().parse(&input)
        XCTAssertEqual(output, [.blue: 3, .red: 4])
    }
    
    func testGameParser() throws {
        var input = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"[...]
        let output = try GameParser().parse(&input)
        XCTAssertEqual(
            output,
            Game(id: 1, hands: [
                [.red: 4, .blue: 3],
                [.red: 1, .green: 2, .blue: 6],
                [.green: 2]
            ])
        )
    }
    
    func testPuzzleInputParser() throws {
        let example = """
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
        """
        var input = example[...]
        let output = try PuzzleInput().parse(&input)
        XCTAssertEqual(output, [
            Game(id: 1, hands: [
                [.red: 4, .blue: 3],
                [.red: 1, .green: 2, .blue: 6],
                [.green: 2]
            ]),
            Game(id: 2, hands: [
                [.blue: 1, .green: 2],
                [.red: 1, .green: 3, .blue: 4],
                [.blue: 1, .green: 1],
            ]),
            Game(id: 3, hands: [
                [.red: 20, .green: 8, .blue: 6],
                [.red: 4, .green: 13, .blue: 5],
                [.red: 1, .green: 5],
            ]),
            Game(id: 4, hands: [
                [.red: 3, .green: 1, .blue: 6],
                [.red: 6, .green: 3],
                [.red: 14, .green: 3, .blue: 15],
            ]),
            Game(id: 5, hands: [
                [.red: 6, .green: 3, .blue: 1],
                [.red: 1, .green: 2, .blue: 2]
            ]),
        ])
    }
    
    
}
