import Foundation

public protocol Day {
    init(input: String)
    func run(part: Part) throws -> String
}

public enum SolutionError: LocalizedError {
    case unimplemented(part: Part)
    case noValueFound(part: Part)
    
    public var errorDescription: String? {
        switch self {
        case .unimplemented(let part):
            return "Part \(part.rawValue) is unimplemented"
        case .noValueFound(let part):
            return "No value was found for \(part.rawValue). Check the solution."
        }
    }
}
