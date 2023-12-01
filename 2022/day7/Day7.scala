//> using scala "3"
//> using lib "org.scalatest::scalatest::3.2.14"
//> using resourceDir "input"

import scala.io.Source

class Node(value: String, parent: Option[Node], children: Seq[Node]) {
    
    def add(child: Node): Unit =
        children :+ child
}

class Computer {
    var filesSystem = Node("/", None, Seq.empty)

}

object Day7 {
    def solve(filename: String): Unit =
        load(filename).map(process)   

    def load(filename: String): Iterator[String] =
        Source.fromFile(filename).getLines()

    def process(lines: String): Unit =
        lines.foreach(println)
}

@main
def app =
    import Day7.*
    val computer = new Computer()
    
    solve("example.txt")