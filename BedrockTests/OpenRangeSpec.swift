
import Foundation
import Nimble
import Quick

@testable import Bedrock

class OpenRangeSpec: QuickSpec {

    override func spec() {
        describe("OpenRange") {
            context("of integers") {
                it("does not allow its lower bound to be greater than its upper bound") {
                    expect({
                        let _ = 4.<.<0
                        return ()
                        }()).to(throwAssertion())
                }

                it("contains neither its lower nor its upper bound") {
                    let range = 0.<.<4
                    expect(range.contains(0)).to(beFalse())
                    expect(range.contains(4)).to(beFalse())
                }

                it("contains some value between its lower and upper bound") {
                    let range = 0.<.<4
                    expect(range.contains(2)).to(beTrue())
                }
            }

            context("of floating-points") {
                it("does not allow its lower bound to be greater than its upper bound") {
                    expect({
                        let _ = 4.0.<.<0.0
                        return ()
                        }()).to(throwAssertion())
                }
                it("contains neither its lower nor its upper bound") {
                    let range = 0.0.<.<2.0
                    expect(range.contains(0.0)).to(beFalse())
                    expect(range.contains(2.0)).to(beFalse())
                }

                it("contains some value between a lower bound and upper bound where lower bound == (upper bound - 1)") {
                    let range = 0.0.<.<1.0
                    expect(range.contains(0.5)).to(beTrue())
                }
            }
        }
    }

}
