import Foundation
import Nimble
import Quick
@testable import Bedrock

class OptionalSpec: QuickSpec {

    override func spec() {

        describe("isEmpty/isNotEmpty") {

            it("returns true/false for none") {
                expect(String?.none.lacksElements).to(beTrue())
                expect(String?.none.hasElements).to(beFalse())
            }

            it("returns true/false for an empty collection") {
                expect(String?.some("").lacksElements).to(beTrue())
                expect(String?.some("").hasElements).to(beFalse())
            }

            it("returns false/true for an occupied collection") {
                expect(String?.some("I-IT'S NOT LIKE I LIKE YOU OR ANYTHING, B-BAKA (//∇//)\\").lacksElements).to(beFalse())
                expect(String?.some("I-IT'S NOT LIKE I LIKE YOU OR ANYTHING, B-BAKA (//∇//)\\").hasElements).to(beTrue())
            }

        }

    }

}

