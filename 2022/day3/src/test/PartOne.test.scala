package day3

import org.scalatest._
import flatspec._
import matchers._
import scala.util.Success

import PartOne.*

class PartOneSpec extends AnyFlatSpec with should.Matchers {

  "firstCommonCharacter" should "find the first common character `p` in `vJrwpWtwJgWr` and `hcsFMMfFFhFp`" in {
    firstCommonCharacter("vJrwpWtwJgWr", "hcsFMMfFFhFp") shouldBe 'p'
  }

  "priorityValue" should "find a priority value for `p`" in {
    priorityValue('p') shouldBe 16
  }

  "priorityValue" should "find a priority value for `P`" in {
    priorityValue('P') shouldBe 42
  }

  "solve" should "find the answer for the example" in {
    solve("example.txt") shouldBe 157
  }

  "solve" should "find the answer for the challenge" in {
    solve("input.txt") shouldBe 7763
  }

}
