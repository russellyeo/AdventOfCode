@testable import Solution
import XCTest

final class AnalyserTests: XCTestCase {
    
    // MARK: - Part One
    
    func testSumOfValidGameIDs() {
        let games: [Game] = [
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
            ])
        ]
        let analyser = Analyser(games: games)
        let result = analyser.sumOfValidGameIDs(maxPossible: [.red: 12, .green: 13, .blue: 14])
        XCTAssertEqual(result, 8)
    }
    
    // MARK: - Part Two
    
    // "In game 1, the game could have been played with as few as 4 red, 2 green, and 6 blue cubes. If any color had even one fewer cube, the game would have been impossible."
    func testMinimumCubes_Game1() {
        let game = Game(id: 1, hands: [
            [.red: 4, .blue: 3],
            [.red: 1, .green: 2, .blue: 6],
            [.green: 2]
        ])
        let analyser = Analyser(games: [])
        let minimum = analyser.minimumCubes(for: game)
        XCTAssertEqual(minimum, [.red: 4, .green: 2, .blue: 6])
    }
    
    // "Game 2 could have been played with a minimum of 1 red, 3 green, and 4 blue cubes."
    func testMinimumCubes_Game2() {
        let game = Game(id: 2, hands: [
            [.blue: 1, .green: 2],
            [.red: 1, .green: 3, .blue: 4],
            [.blue: 1, .green: 1],
        ])
        let analyser = Analyser(games: [])
        let minimum = analyser.minimumCubes(for: game)
        XCTAssertEqual(minimum, [.red: 1, .green: 3, .blue: 4])
    }
    
    // "Game 3 must have been played with at least 20 red, 13 green, and 6 blue cubes."
    func testMinimumCubes_Game3() {
        let game = Game(id: 3, hands: [
            [.red: 20, .green: 8, .blue: 6],
            [.red: 4, .green: 13, .blue: 5],
            [.red: 1, .green: 5],
        ])
        let analyser = Analyser(games: [])
        let minimum = analyser.minimumCubes(for: game)
        XCTAssertEqual(minimum, [.red: 20, .green: 13, .blue: 6])
    }
    
    // "Game 4 required at least 14 red, 3 green, and 15 blue cubes."
    func testMinimumCubes_Game4() {
        let game = Game(id: 4, hands: [
            [.red: 3, .green: 1, .blue: 6],
            [.red: 6, .green: 3],
            [.red: 14, .green: 3, .blue: 15],
        ])
        let analyser = Analyser(games: [])
        let minimum = analyser.minimumCubes(for: game)
        XCTAssertEqual(minimum, [.red: 14, .green: 3, .blue: 15])
    }
    
    // "Game 5 needed no fewer than 6 red, 3 green, and 2 blue cubes in the bag."
    func testMinimumCubes_Game5() {
        let game = Game(id: 5, hands: [
            [.red: 6, .green: 3, .blue: 1],
            [.red: 1, .green: 2, .blue: 2]
        ])
        let analyser = Analyser(games: [])
        let minimum = analyser.minimumCubes(for: game)
        XCTAssertEqual(minimum, [.red: 6, .green: 3, .blue: 2])
    }
    
    // "The power of the minimum set of cubes in game 1 is 48."
    func testPowerOfSet_Game1() {
        let analyser = Analyser(games: [])
        let set: [Colour: Int] = [.red: 4, .green: 2, .blue: 6]
        let power = analyser.power(of: set)
        XCTAssertEqual(power, 48)
    }
    
    func testSumOfPowersOfMinimumCubes() {
        let games: [Game] = [
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
            ])
        ]
        let analyser = Analyser(games: games)
        let result = analyser.sumOfPowersOfMinimumCubes()
        XCTAssertEqual(result, 2286)
    }
    
}
