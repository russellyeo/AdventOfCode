//> using scala "3"
//> using lib "org.scalatest::scalatest::3.2.14"
//> using resourceDir "input"

import scala.io.Source
import scala.collection.mutable.ArrayBuffer

class PacketDecoder(filename: String, markerSize: Int):
    val source: Source = Source.fromResource(filename)
    val buffer = ArrayBuffer[Char]()

    def findStartOfMessage(): Int =
        findMarkerPosition(0)
    
    def findMarkerPosition(position: Int): Int =
        if buffer.size < markerSize then
            buffer.addOne(source.next())
            findMarkerPosition(position + 1)
        else if bufferIsUnique() then
            position
        else 
            buffer.trimStart(1)
            buffer.addOne(source.next())
            findMarkerPosition(position + 1)
 
    def bufferIsUnique(): Boolean =
        buffer.toSet.size == buffer.size


end PacketDecoder

@main
def app = 
    val decoder = PacketDecoder("challenge.txt", 14)
    val startOfMessage = decoder.findStartOfMessage()
    println(startOfMessage)