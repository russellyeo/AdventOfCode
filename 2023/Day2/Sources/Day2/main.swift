import Solution

do {
    var rawInput = challenge[...]
    let puzzleInput = try PuzzleInput().parse(&rawInput)
    let answer = Analyser().sumOfValidGameIDs(games: puzzleInput, maxPossible: [.red: 12, .green: 13, .blue: 14])
    print("Answer: \(answer)")
} catch {
    print("Error: \(error)")
}
