
import Foundation
import Nimble
import Quick

class NSArraySpec: QuickSpec {

    override func spec() {

        describe("The functional NSArray method all") {

            it("Returns true when the array is empty") {
                let argument = NSArray(array: [])
                let evaluation = argument.duet_all { element in
                    return (element as! Int) < 0
                }
                expect(evaluation).to(beTrue())
            }

            it("Returns true when all elements satisfy the predicate") {
                let argument = NSArray(array: [1, 2, 3, 4])
                let evaluation = argument.duet_all { element in
                    return (element as! Int) > 0
                }
                expect(evaluation).to(beTrue())
            }

            it("Returns false when at least one element does not satisfy the predicate") {
                let argument = NSArray(array: [1, 2, 3, 4, -100])
                let evaluation = argument.duet_all { element in
                    return (element as! Int) > 0
                }
                expect(evaluation).to(beFalse())
            }

        }

    }

}
