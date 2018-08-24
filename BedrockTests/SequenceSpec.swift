import Foundation
import Nimble
import Quick
@testable import Bedrock

class SequenceSpec: QuickSpec {

    override func spec() {

        describe("The partition method") {

            it("returns two empty arrays when evaluated with an empty array") {
                let (fst, snd) = [Int]().bedrock.partition { $0 > 2 }
                expect(fst).to(equal([]))
                expect(snd).to(equal([]))
            }

            it("returns the evaluated array and an empty array when all elements satisfy the predicate") {
                let (fst, snd) = [3, 4, 5].bedrock.partition { $0 > 2 }
                expect(fst).to(equal([3, 4, 5]))
                expect(snd).to(equal([]))
            }

            it("returns an empty array and the evaluated array when all elements do not satisfy the predicate") {
                let (fst, snd) = [3, 4, 5].bedrock.partition { $0 < 2 }
                expect(fst).to(equal([]))
                expect(snd).to(equal([3, 4, 5]))
            }

            it("correctly partitions a routine array") {
                let (fst, snd) = [1, 2, 3, 4, 5, 6, 7, 8, 9].bedrock.partition { $0 & 1 == 1 }
                expect(fst).to(equal([1, 3, 5, 7, 9]))
                expect(snd).to(equal([2, 4, 6, 8]))
            }

        }

        describe("The any method") {

            it("returns false for an empty array") {
                expect([Int]().bedrock.any { $0 > 2 }).to(beFalse())
            }

            it("returns true when exactly one element satisfies the predicate") {
                expect([1, 2, 3].bedrock.any { $0 > 2 }).to(beTrue())
            }

            it("returns true when more than one element satisfies the predicate") {
                expect([1, 2, 3, 4].bedrock.any { $0 > 2 }).to(beTrue())
            }

            it("returns false when no element satisfies the predicate") {
                expect([1, 2, 3, 4].bedrock.any { $0 > 6 }).to(beFalse())
            }

        }

        describe("The all method") {

            it("returns true for an empty array") {
                expect([Int]().bedrock.all { $0 > 2 }).to(beTrue())
            }

            it("returns false when exactly one element does not satisfy the predicate") {
                expect([1, 2, 3].bedrock.all { $0 & 1 == 1 }).to(beFalse())
            }

            it("returns false when no elements satisfy the predicate") {
                expect([1, 2, 3, 4].bedrock.any { $0 > 5 }).to(beFalse())
            }

            it("returns true when all elements satisfy the predicate") {
                expect([1, 2, 3, 4].bedrock.any { $0 > 0 }).to(beTrue())
            }

        }

        describe("The map(accessing:) method") {

            it("returns an empty array for an empty array") {
                expect([Int]().bedrock.map(accessing: \Int.description)).to(equal([]))
            }

            it("returns the property for each element") {
                expect([1, 2, 3].bedrock.map(accessing: \Int.description)).to(equal(["1", "2", "3"]))
            }

        }

        describe("The filter(accepting:) method") {

            it("returns an empty array for an empty array") {
                expect([Int]().bedrock.filter(accepting: \.isNegative)).to(equal([]))
            }

            it("returns the same array when accepting all true values") {
                expect([-1, -2, -3].bedrock.filter(accepting: \.isNegative)).to(equal([-1, -2, -3]))
            }

            it("returns an empty array when accepting all false values") {
                expect([1, 2, 3].bedrock.filter(accepting: \.isNegative)).to(equal([]))
            }

            it("returns the correct array when accepting mixed values") {
                expect([-1, 2, 3, -4, -5, 6, -7].bedrock.filter(accepting: \.isNegative)).to(equal([-1, -4, -5, -7]))
            }

        }

        describe("The filter(rejecting:) method") {

            it("returns an empty array for an empty array") {
                expect([Int]().bedrock.filter(rejecting: \.isNegative)).to(equal([]))
            }

            it("returns an empty array when rejecting all true values") {
                expect([-1, -2, -3].bedrock.filter(rejecting: \.isNegative)).to(equal([]))
            }

            it("returns the same array when rejecting all false values") {
                expect([1, 2, 3].bedrock.filter(rejecting: \.isNegative)).to(equal([1, 2, 3]))
            }

            it("returns the correct array when rejecting mixed values") {
                expect([-1, 2, 3, -4, -5, 6, -7].bedrock.filter(rejecting: \.isNegative)).to(equal([2, 3, 6]))
            }

        }

    }

}

fileprivate extension Int {
    var isNegative: Bool {
        return self <= 0
    }
}
