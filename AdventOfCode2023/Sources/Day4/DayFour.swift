import Solutions

public struct DayFour: Day {
    private let input: String
    
    public init(input: String) {
        self.input = input
    }
    
    public func run(part: Part) throws -> String {
        var rawInput = input[...]
        let scratchcards = try PuzzleInput().parse(&rawInput)
        
        switch part {
        case .one:
            let answer = scratchcards.calculateScore()
            return String(answer)
        case .two:
            let answer = scratchcards.process()
            return String(answer)
        }
    }
}
