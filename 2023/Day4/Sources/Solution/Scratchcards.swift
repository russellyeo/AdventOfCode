import Foundation

public struct Scratchcards {
    public let cards: [Card]
    
    public init(cards: [Card]) {
        self.cards = cards
    }
    
    public func process() -> Int {
        var counts = Array(repeating: 1, count: cards.count)
        
        for (index, card) in cards.enumerated() {
            let numberOfMatches = numberOfMatches(in: card)
            
            guard numberOfMatches > 0 else {
                continue
            }
            
            for offset in 1...numberOfMatches where offset + index < cards.count {
                let newIndex = index + offset
                counts[newIndex] += counts[index]
            }
        }
        
        return counts.reduce(into: 0, +=)
    }
    
    public func calculateScore() -> Int {
        cards.reduce(into: 0) { score, card in
            score += calculateScore(for: card)
        }
    }
    
    private func calculateScore(for card: Card) -> Int {
        let count = numberOfMatches(in: card)
        guard count > 0 else { return 0 }
        return 2 ^^ (count - 1)
    }
    
    private func numberOfMatches(in card: Card) -> Int {
        card.mine.reduce(into: 0) { count, number in
            count += card.winning.contains(number) ? 1 : 0
        }
    }

}

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}
