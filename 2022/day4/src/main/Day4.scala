import zio.*
import zio.stream.*
import zio.Console.*

object Day4 extends ZIOAppDefault {

    def solve(filename: String): IO[Throwable, Unit] =
        for {
            // Part 1
            _ <- stream(filename)
                .filter(doesFullyContain)
                .run(ZSink.count)
                .map(x => println(s"Part 1: $x"))
            // Part 2
            _ <- stream(filename)
                .filter(doesOverlap)
                .run(ZSink.count)
                .map(x => println(s"Part 2: $x"))
        } yield ()

    /** Returns true if one range fully contains the other */        
    def doesFullyContain(left: Range, right: Range): Boolean =
        left.contains(right.start) && left.contains(right.end) ||
            right.contains(left.start) && right.contains(left.end)

    /** Returns true if one range overlaps with the other */     
    def doesOverlap(left: Range, right: Range): Boolean =
        left.contains(right.start) || left.contains(right.end) ||
            right.contains(left.start) || right.contains(left.end)

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