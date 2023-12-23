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
            guard let location = almanac.findClosestLocation() else {
                throw SolutionError.noValueFound(part: part)
            }
            return String(location)
        case .two:
            throw SolutionError.unimplemented(part: part)
        }
    }
}
