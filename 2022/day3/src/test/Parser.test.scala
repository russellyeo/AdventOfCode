package day3

import org.scalatest._
import flatspec._
import matchers._
import scala.util.Success

import Parser.*

class ParserSpec extends AnyFlatSpec with should.Matchers {

  "Parser" should "parse example.txt" in {
    val input = parse("example.txt")
    input shouldBe Success(List(
        ("vJrwpWtwJgWr","hcsFMMfFFhFp"),
        ("jqHRNqRjqzjGDLGL","rsFMfFZSrLrFZsSL"),
        ("PmmdzqPrV","vPwwTWBwg"),
        ("wMqvLMZHhHMvwLH","jbvcjnnSBnvTQFn"),
        ("ttgJtRGJ","QctTZtZT"),
        ("CrZsJsPPZsGz","wwsLwLmpwMDw")
    ))   
  }

}

