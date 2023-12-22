import Foundation

enum InputError {
    /// The given day not in the range of possibilities
    case invalidDay(_ day: Int)
    /// The given part not in the range of possibilities
    case invalidPart(_ part: Int)
    /// The given input type is not in the range of possibilities
    case invalidType(_ type: String)
}

extension InputError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidDay(let day):
            return "Invalid day: \(day). Must be between 1 and 25."
        case .invalidPart(let part):
            return "Invalid part: \(part). Must be either 1 or 2."
        case .invalidType(let type):
            return "Invalid type: \(type). Must be either 'example' or 'challenge'"
        }
    }
}
