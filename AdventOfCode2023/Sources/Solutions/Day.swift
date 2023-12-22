import Foundation

public protocol Day {
    init(input: String)
    func run(part: Part) throws -> String
}
