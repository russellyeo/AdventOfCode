import zio.*
import zio.stream.*
import zio.Console.*

object Day4 extends ZIOAppDefault {

    def solve(filename: String): IO[Throwable, Unit] =
        stream(filename)
            .filter(doesFullyContain)
            .run(ZSink.count)
            .map(x => println(s"Part One: $x"))

    /** Returns true if one range fully contains the other */        
    def doesFullyContain(left: Range, right: Range): Boolean =
        left.contains(right.start) && left.contains(right.end) ||
            right.contains(left.start) && right.contains(left.end)

    /** Visualize a pair of ranges */
    def visualizePair(left: Range, right: Range): IO[Throwable, Unit] =
        val max = left.end.max(right.end)
        visualizeRange(left, max) *> visualizeRange(right, max) *> printLine("")

    /** Print a range visually e.g. `3-5` becomes `..345....` */
    def visualizeRange(range: Range, max: Int): IO[Throwable, Unit] =
        val line = (1 to max).map { n => if (range.contains(n)) n.toString else "." }.mkString
        printLine(line)

    /** Convert string e.g. `"2-4"` to `Range(2,4)` */
    def toRange(string: String): Range =
        val r = string.split("-").map(_.toInt)
        r(0) to r(1)

    /** Stream pairs of ranges from file */
    def stream(filename: String): ZStream[Any, Throwable, (Range, Range)] =
        ZStream.fromResource(filename)
            .via(ZPipeline.utf8Decode >>> ZPipeline.splitLines)
            .via(ZPipeline.map { line =>
                val ranges = line.split(",").map(toRange)
                (ranges(0), ranges(1))
            })
    val run = solve("input.txt")

}