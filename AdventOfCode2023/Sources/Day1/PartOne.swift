import Foundation

public struct PartOne {
    public init() {}
    
    public func solve(for input: String) -> Int {
        input
            .split(separator: "\n")
            .compactMap { line in
                guard
                    let first = line.first(where: { $0.isNumber }).map(String.init),
                    let last = line.last(where: { $0.isNumber }).map(String.init),
                    let combined = Int(first + last)
                else {
                    return nil
                }
                return combined
            }
            .reduce(into: 0, +=)
    }
}
