import ArgumentParser
import Day1
import Day2
import Day3
import PuzzleInput
import Solutions

@main
struct CLI: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Advent of Code 2023 Solutions."
    )
    
    @Option(help: "The day to run (1-25)")
    private var day: Int

    @Option(help: "The part of the day to run (either 1 or 2)")
    private var part: Int
    
    @Option(help: "The type of input to try (either 'example' or 'challenge')")
    private var type: String = "example"

    func run() throws {
        guard 1...25 ~= day else { throw InputError.invalidDay(day) }
        guard 1...2 ~= part else { throw InputError.invalidPart(part) }
            
        guard let part = Part(from: part) else {
            throw InputError.invalidPart(part)
        }
        guard let type = InputType(rawValue: type) else {
            throw InputError.invalidType(type)
        }
        
        let input = try FileReader().read(day: day, type: type.rawValue)
        let day = try ProblemStrategy().select(day: day, with: input)
        
        try measure("Day: \(self.day), Part: \(self.part), Type: \(self.type)") { completion in
            let answer = try day.run(part: part)
            completion(answer)
        }
    }
}
