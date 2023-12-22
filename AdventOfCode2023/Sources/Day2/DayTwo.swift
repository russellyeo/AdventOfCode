import Solutions

public struct DayTwo: Day {
    private let input: String
    
    public init(input: String) {
        self.input = input
    }
    
    public func run(part: Part) throws -> String {
        var rawInput = input[...]
        let puzzleInput = try PuzzleInput().parse(&rawInput)
        let analyser = Analyser(games: puzzleInput)
        
        switch part {
        case .one:
            let answer = analyser.sumOfValidGameIDs(maxPossible: [.red: 12, .green: 13, .blue: 14])
            return String(answer)
        case .two:
            let answer = analyser.sumOfPowersOfMinimumCubes()
            return String(answer)
        }
    }
}
