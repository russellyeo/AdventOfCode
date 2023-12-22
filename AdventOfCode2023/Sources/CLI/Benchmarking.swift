import Foundation

/// https://stackoverflow.com/a/31412302
func measure(_ title: String, block: (((String) -> Void) throws -> ())) rethrows {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 6
    
    let startTime = CFAbsoluteTimeGetCurrent()
    
    try block { answer in
        let timeElapsedInMilliseconds = (CFAbsoluteTimeGetCurrent() - startTime) * 1000
        let timeElapsedFormatted = numberFormatter.string(from: NSNumber(value: timeElapsedInMilliseconds)) ?? ""
        print("\(title) :: Time: \(timeElapsedFormatted)ms")
        print("Answer: \(answer)")
    }
}
