import Solutions

public struct DayThree: Day {
    private let input: String
    
    public init(input: String) {
        self.input = input
    }
    
    public func run(part: Part) throws -> String {
        var rawInput = input[...]
        let grid = try PuzzleInput().parse(&rawInput)
        let schematic = EngineSchematic(grid: grid)
        
        switch part {
        case .one:
            let answer = schematic.sumOfValidPartNumbers()
            return String(answer)
        case .two:
            let answer = schematic.sumOfGearRatios()
            return String(answer)
        }
    }
}
