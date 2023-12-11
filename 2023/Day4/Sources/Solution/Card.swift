import Foundation

public struct Card: Equatable {
    public let id: Int
    public let winning: [Int]
    public let mine: [Int]
    
    public init(id: Int, winning: [Int], mine: [Int]) {
        self.id = id
        self.winning = winning
        self.mine = mine
    }
}
