import Solution

do {
    var rawInput = challenge[...]
    let puzzleInput = try PuzzleInput().parse(&rawInput)
    let analyser = Analyser(games: puzzleInput)
    let partOne = analyser.sumOfValidGameIDs(maxPossible: [.red: 12, .green: 13, .blue: 14])
    let partTwo = analyser.sumOfPowersOfMinimumCubes()
    print("Answer (Part One): \(partOne)")
    print("Answer (Part Two): \(partTwo)")
} catch {
    print("Error: \(error)")
}
