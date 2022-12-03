package day3

import org.scalatest._
import flatspec._
import matchers._
import scala.util.Success

import PartTwo.*

class PartTwoSpec extends AnyFlatSpec with should.Matchers {

  "firstCommonCharacter" should "find the first common character in three strings" in {
    findCommonCharacter("vJrwpWtwJgWrhcsFMMfFFhFp", "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL", "PmmdzqPrVvPwwTWBwg") shouldBe 'r'
  }

  "solve" should "find the answer for the example" in {
    solve("example.txt") shouldBe 70
  }

  "solve" should "find the answer for the challenge" in {
    solve("input.txt") shouldBe 2569
  }

}
