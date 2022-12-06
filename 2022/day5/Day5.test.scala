import Day5.*
import StartingPosition.*

import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should

class Day5Spec extends AnyFlatSpec with should.Matchers:

    "solve example.txt" should "return CMZ" in {
        solve("example.txt", example) shouldBe List('C', 'M', 'Z')
    }

    "1st move in example" should "move 1 from 2 to 1" in {
        val stacks = List(
            List('N', 'Z'),
            List('D', 'C', 'M'),
            List('P')
        )
        val action = Action(1, 2, 1)
        val expected = List(
            List('D', 'N', 'Z'),
            List('C', 'M'),
            List('P')
        )
        val result = move(stacks, action)
        result shouldBe expected
    }

    "2nd move in example" should "move 3 from 1 to 3" in {
        val stacks = List(
            List('D', 'N', 'Z'),
            List('C', 'M'),
            List('P')
        )
        val action = Action(3, 1, 3)
            val expected = List(
            List(),
            List('C', 'M'),
            List('Z', 'N', 'D', 'P')
        )
        val result = move(stacks, action)
        result shouldBe expected
    }

    "3rd move in example" should "move 2 from 2 to 1" in {
        val stacks = List(
            List(),
            List('C', 'M'),
            List('Z', 'N', 'D', 'P')
        )
        val action = Action(2, 2, 1)
        val expected = List(
            List('M', 'C'),
            List(),
            List('Z', 'N', 'D', 'P')
        )
        val result = move(stacks, action)
        result shouldBe expected
    }

    "4th move in example" should "move 1 from 1 to 2" in {
        val stacks = List(
            List('M', 'C'),
            List(),
            List('Z', 'N', 'D', 'P')
        )
        val action = Action(1, 1, 2)
        val expected = List(
            List('C'),
            List('M'),
            List('Z', 'N', 'D', 'P')
        )
        val result = move(stacks, action)
        result shouldBe expected
    }

end Day5Spec
