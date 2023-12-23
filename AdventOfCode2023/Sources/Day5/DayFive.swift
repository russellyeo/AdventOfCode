import Solutions

public struct DayFive: Day {
    private let input: String
    
    public init(input: String) {
        self.input = input
    }
    
    public func run(part: Part) throws -> String {
        var rawInput = input[...]
        let almanac: Almanac = try AlmanacParser().parse(&rawInput)
        
        switch part {
        case .one:
            return "TODO"
        case .two:
            return "TODO"
        }
    }
}
