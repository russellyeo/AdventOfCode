import Foundation

public struct Analyser {
    private let games: [Game]
    private let allColours: [Colour] = [.red, .green, .blue]
    
    public init(games: [Game]) {
        self.games = games
    }
    
    public func sumOfValidGameIDs(maxPossible: [Colour: Int]) -> Int {
        games.filter { game in
            game.hands.allSatisfy { hand in
                allColours.allSatisfy { colour in
                    (hand[colour] ?? 0 <= maxPossible[colour] ?? 0)
                }
            }
        }
        .map(\.id)
        .reduce(0, +)
    }

    
    public func sumOfPowersOfMinimumCubes() -> Int {
        games
            .map { game -> Int in
                power(of: minimumCubes(for: game))
            }
            .reduce(0, +)
    }
    
    func minimumCubes(for game: Game) -> [Colour: Int] {
        let initialCubeCount = Dictionary(uniqueKeysWithValues: allColours.map { ($0, 0) })
        return game.hands.reduce(into: initialCubeCount) { result, hand in
            allColours.forEach { colour in
                result[colour] = max(result[colour] ?? 0, hand[colour] ?? 0)
            }
        }
    }
    
    func power(of set: [Colour: Int]) -> Int {
        set.values.reduce(1, *)
    }

}
