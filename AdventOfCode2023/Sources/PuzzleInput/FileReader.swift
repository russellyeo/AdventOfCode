import Foundation

public struct FileReader {
    public init() {}

    public func read(day: Int, type: String) throws -> String {
        guard let fileURL = Bundle.module.url(forResource: "\(day)_\(type)", withExtension: "txt") else {
            throw FileReaderError.invalidFileURL
        }

        let contents: String
        do {
            contents = try String(contentsOf: fileURL, encoding: .utf8)
        } catch {
            throw error
        }
        return contents
    }
}

private enum FileReaderError: LocalizedError {
    case invalidFileURL
    
    var errorDescription: String? {
        switch self {
        case .invalidFileURL:
            return "The file could not be found"
        }
    }
}
