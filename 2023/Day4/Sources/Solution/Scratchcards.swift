import Foundation

public struct Scratchcards {
    public let cards: [Card]
    
    public init(cards: [Card]) {
        self.cards = cards
    }
    
    public func calculateScore() -> Int {
        cards.reduce(into: 0) { score, card in
            score += calculateScore(for: card)
        }
    }
    
    public func calculateScore(for card: Card) -> Int {
        let count = card.mine.reduce(into: 0) { count, number in
            count += card.winning.contains(number) ? 1 : 0
        }
        guard count > 0 else { return 0 }
        return 2 ^^ (count - 1)
    }
}

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}
