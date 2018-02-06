
import Foundation
import Nimble
import Quick

class OptionalSpec: QuickSpec {

    override func spec() {

        describe("isEmpty/isNotEmpty") {

            it("returns true/false for none") {
                expect(String?.none.isEmpty).to(beTrue())
                expect(String?.none.isNotEmpty).to(beFalse())
            }

            it("returns true/false for an empty collection") {
                expect(String?.some("").isEmpty).to(beTrue())
                expect(String?.some("").isNotEmpty).to(beFalse())
            }

            it("returns false/true for an occupied collection") {
                expect(String?.some("I-IT'S NOT LIKE I LIKE YOU OR ANYTHING, B-BAKA (//∇//)\\").isEmpty).to(beFalse())
                expect(String?.some("I-IT'S NOT LIKE I LIKE YOU OR ANYTHING, B-BAKA (//∇//)\\").isNotEmpty).to(beTrue())
            }

        }

    }

}

