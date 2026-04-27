import Foundation
import Testing
@testable import Bedrock

@Suite("isEmpty/isNotEmpty")
struct OptionalTests {

    @Test("returns true/false for none")
    func none() {
        #expect(String?.none.lacksElements == true)
        #expect(String?.none.hasElements == false)
    }

    @Test("returns true/false for an empty collection")
    func emptyCollection() {
        #expect(String?.some("").lacksElements == true)
        #expect(String?.some("").hasElements == false)
    }

    @Test("returns false/true for an occupied collection")
    func occupiedCollection() {
        #expect(String?.some("I-IT'S NOT LIKE I LIKE YOU OR ANYTHING, B-BAKA (//∇//)\\").lacksElements == false)
        #expect(String?.some("I-IT'S NOT LIKE I LIKE YOU OR ANYTHING, B-BAKA (//∇//)\\").hasElements == true)
    }

}
