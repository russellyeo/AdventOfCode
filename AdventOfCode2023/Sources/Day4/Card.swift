import Foundation

public struct Card: Hashable, Identifiable {
    public let id: Int
    public let winning: [Int]
    public let mine: [Int]
    
    public init(id: Int, winning: [Int], mine: [Int]) {
        self.id = id
        self.winning = winning
        self.mine = mine
    }
}
