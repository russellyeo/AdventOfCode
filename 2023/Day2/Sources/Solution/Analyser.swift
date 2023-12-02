import Foundation

public struct Analyser {
    public init() {}
    public func sumOfValidGameIDs(games: [Game], maxPossible: [Colour: Int]) -> Int {
        var possible: [Game] = []
        for game in games {
            if game.hands.allSatisfy({ hand in
                return (hand[.red] ?? 0 <= maxPossible[.red] ?? 0)
                    && (hand[.green] ?? 0 <= maxPossible[.green] ?? 0)
                    && (hand[.blue] ?? 0 <= maxPossible[.blue] ?? 0)
            }) {
                possible.append(game)
            }
        }
        return possible.map(\.id).reduce(into: 0, +=)
    }
}
