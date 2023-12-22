import Foundation

public enum Part: String {
    case one
    case two
    
    public init?(from: Int) {
        switch from {
        case 1:
            self = .one
        case 2:
            self = .two
        default:
            return nil
        }
    }
}
