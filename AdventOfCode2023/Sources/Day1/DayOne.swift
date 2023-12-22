import Solutions

public struct DayOne: Day {
    private let input: String
    
    public init(input: String) {
        self.input = input
    }
    
    public func run(part: Part) -> String {
        switch part {
        case .one:
            let answer = PartOne().solve(for: input)
            return String(answer)
        case .two:
            let answer = PartTwo().solve(for: input)
            return String(answer)
        }
    }
}
