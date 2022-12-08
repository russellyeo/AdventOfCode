//> using scala "3"
//> using lib "org.scalatest::scalatest::3.2.14"
//> using resourceDir "input"

import scala.io.Source
import scala.collection.mutable.ArrayBuffer

class Parser(filename: String):
    val source: Source = Source.fromResource(filename)
    val buffer = ArrayBuffer[Char]()

    def solve(): Int =
        findMatch(0)
    
    def findMatch(position: Int): Int =
        if buffer.size < 4 then
            buffer.addOne(source.next())
            findMatch(position + 1)
        else if bufferIsUnique() then
            position
        else 
            buffer.trimStart(1)
            buffer.addOne(source.next())
            findMatch(position + 1)
 
    def bufferIsUnique(): Boolean =
        buffer.toSet.size == buffer.size


end Parser

@main
def app = 
    val parser = Parser("challenge.txt")
    val answer = parser.solve()
    println(answer)