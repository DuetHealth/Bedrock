//
//  LowerHalfOpenRangeSpec.swift
//  BedrockTests
//
//  Created by sylvester watts on 2/6/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation
import Nimble
import Quick

@testable import Bedrock

class LowerHalfOpenRangeSpec: QuickSpec {

    override func spec() {
        describe("LowerHalfOpenRange") {
            context("of integers") {
                it("does not allow its lower bound to be greater than its upper bound") {
                    expect({
                        let _ = 4.<..0
                        return ()
                        }()).to(throwAssertion())
                }

                it("does not contain its lower bound but does contain its upper bound") {
                    let range = 0.<..4
                    expect(range.contains(0)).to(beFalse())
                    expect(range.contains(4)).to(beTrue())
                }

                it("contains some value between its lower and upper bound") {
                    let range = 0.<..4
                    expect(range.contains(2)).to(beTrue())
                }

                it("contains one value when the bounds are equal") {
                    let range = 0.<..0
                    expect(range.contains(0)).to(beTrue())
                }
            }
        }
    }

}
