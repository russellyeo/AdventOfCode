import Foundation

public struct PartTwo {
    public init() {}
    private let mappings: [String: String] = [
        "1": "1",
        "2": "2",
        "3": "3",
        "4": "4",
        "5": "5",
        "6": "6",
        "7": "7",
        "8": "8",
        "9": "9",
        "one": "1",
        "two": "2",
        "three": "3",
        "four": "4",
        "five": "5",
        "six": "6",
        "seven": "7",
        "eight": "8",
        "nine": "9"
    ]
    
    public func solve(for input: String) -> Int {
        input
            .split(separator: "\n")
            .reduce(into: 0) { (sum, line) in
                let digits = Array(mappings.keys)
                if let firstMatch = line.firstMatch(from: digits),
                    let lastMatch = line.lastMatch(from: digits),
                    let firstDigit = mappings[firstMatch],
                    let lastDigit = mappings[lastMatch],
                    let combined = Int(firstDigit + lastDigit) {
                    sum += combined
                }
            }
    }
}

extension Substring {
    func firstMatch(from array: [String]) -> String? {
        return array
            .compactMap { string in
                if let range = range(of: string) {
                    return (range.lowerBound, string)
                } else {
                    return nil
                }
            }
            .min(by: { $0.0 < $1.0 })?.1
    }
    
    func lastMatch(from array: [String]) -> String? {
        return array
            .compactMap { string in
                if let range = range(of: string, options: .backwards) {
                    return (range.lowerBound, string)
                } else {
                    return nil
                }
            }
            .max(by: { $0.0 < $1.0 })?.1
    }
}

