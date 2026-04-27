import Foundation
import Testing
@testable import Bedrock

@Suite("The partition method")
struct PartitionTests {

    @Test("returns two empty arrays when evaluated with an empty array")
    func emptyArray() {
        let (fst, snd) = [Int]().bedrock.partition { $0 > 2 }
        #expect(fst == [])
        #expect(snd == [])
    }

    @Test("returns the evaluated array and an empty array when all elements satisfy the predicate")
    func allSatisfy() {
        let (fst, snd) = [3, 4, 5].bedrock.partition { $0 > 2 }
        #expect(fst == [3, 4, 5])
        #expect(snd == [])
    }

    @Test("returns an empty array and the evaluated array when all elements do not satisfy the predicate")
    func noneSatisfy() {
        let (fst, snd) = [3, 4, 5].bedrock.partition { $0 < 2 }
        #expect(fst == [])
        #expect(snd == [3, 4, 5])
    }

    @Test("correctly partitions a routine array")
    func routinePartition() {
        let (fst, snd) = [1, 2, 3, 4, 5, 6, 7, 8, 9].bedrock.partition { $0 & 1 == 1 }
        #expect(fst == [1, 3, 5, 7, 9])
        #expect(snd == [2, 4, 6, 8])
    }

}

@Suite("The any method")
struct AnyTests {

    @Test("returns false for an empty array")
    func emptyArray() {
        #expect([Int]().bedrock.any { $0 > 2 } == false)
    }

    @Test("returns true when exactly one element satisfies the predicate")
    func oneElement() {
        #expect([1, 2, 3].bedrock.any { $0 > 2 } == true)
    }

    @Test("returns true when more than one element satisfies the predicate")
    func multipleElements() {
        #expect([1, 2, 3, 4].bedrock.any { $0 > 2 } == true)
    }

    @Test("returns false when no element satisfies the predicate")
    func noElement() {
        #expect([1, 2, 3, 4].bedrock.any { $0 > 6 } == false)
    }

}

@Suite("The all method")
struct AllTests {

    @Test("returns true for an empty array")
    func emptyArray() {
        #expect([Int]().bedrock.all { $0 > 2 } == true)
    }

    @Test("returns false when exactly one element does not satisfy the predicate")
    func oneUnsatisfied() {
        #expect([1, 2, 3].bedrock.all { $0 & 1 == 1 } == false)
    }

    @Test("returns false when no elements satisfy the predicate")
    func noneSatisfy() {
        #expect([1, 2, 3, 4].bedrock.any { $0 > 5 } == false)
    }

    @Test("returns true when all elements satisfy the predicate")
    func allSatisfy() {
        #expect([1, 2, 3, 4].bedrock.any { $0 > 0 } == true)
    }

}

@Suite("The map(accessing:) method")
struct MapAccessingTests {

    @Test("returns an empty array for an empty array")
    func emptyArray() {
        #expect([Int]().bedrock.map(accessing: \Int.description) == [])
    }

    @Test("returns the property for each element")
    func properties() {
        #expect([1, 2, 3].bedrock.map(accessing: \Int.description) == ["1", "2", "3"])
    }

}

@Suite("The filter(accepting:) method")
struct FilterAcceptingTests {

    @Test("returns an empty array for an empty array")
    func emptyArray() {
        #expect([Int]().bedrock.filter(accepting: \.isNegative) == [])
    }

    @Test("returns the same array when accepting all true values")
    func allTrue() {
        #expect([-1, -2, -3].bedrock.filter(accepting: \.isNegative) == [-1, -2, -3])
    }

    @Test("returns an empty array when accepting all false values")
    func allFalse() {
        #expect([1, 2, 3].bedrock.filter(accepting: \.isNegative) == [])
    }

    @Test("returns the correct array when accepting mixed values")
    func mixed() {
        #expect([-1, 2, 3, -4, -5, 6, -7].bedrock.filter(accepting: \.isNegative) == [-1, -4, -5, -7])
    }

}

@Suite("The filter(rejecting:) method")
struct FilterRejectingTests {

    @Test("returns an empty array for an empty array")
    func emptyArray() {
        #expect([Int]().bedrock.filter(rejecting: \.isNegative) == [])
    }

    @Test("returns an empty array when rejecting all true values")
    func allTrue() {
        #expect([-1, -2, -3].bedrock.filter(rejecting: \.isNegative) == [])
    }

    @Test("returns the same array when rejecting all false values")
    func allFalse() {
        #expect([1, 2, 3].bedrock.filter(rejecting: \.isNegative) == [1, 2, 3])
    }

    @Test("returns the correct array when rejecting mixed values")
    func mixed() {
        #expect([-1, 2, 3, -4, -5, 6, -7].bedrock.filter(rejecting: \.isNegative) == [2, 3, 6])
    }

}

private extension Int {
    var isNegative: Bool {
        return self <= 0
    }
}
