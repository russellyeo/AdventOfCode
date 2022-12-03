package day3

object PartOne { 

    def solve(filename: String): Int =
        val input = Parser.parse(filename).get
        val values = input map firstCommonCharacter map priorityValue
        values.sum

    def firstCommonCharacter(left: String, right: String): Char =
        left.intersect(right).head

    def priorityValue(character: Char): Int =
        val characters = ('a' to 'z') ++ ('A' to 'Z')
        characters.indexOf(character) + 1

}

@main
def partOneApp =
    import PartOne.*
    val answer = solve("input.txt")
    println(s"The answer is $answer")

    