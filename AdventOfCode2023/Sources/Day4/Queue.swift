import Foundation

struct Queue<Element> {
    private var elements: [Element] = []

    init() {}

    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    mutating func enqueue(_ value: Element) {
        elements.append(value)
    }
 
    mutating func dequeue() -> Element? {
        return isEmpty ? nil : elements.removeFirst()
    }
}

