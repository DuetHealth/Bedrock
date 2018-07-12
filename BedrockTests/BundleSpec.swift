//
//  BundleSpec.swift
//  BedrockTests
//
//  Created by Ryan Wachowski on 7/12/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import Bedrock

class bundleSpec: QuickSpec {

    override func spec() {

        describe ("Intializing bundles from instances") {

            it("Returns the same Bundle for instances from the same module") {
                let firstBundle = Bundle(of: DateFormatter())
                let secondBundle = Bundle(of: NumberFormatter())
                expect(firstBundle).to(equal(secondBundle))
            }

            it("Returns a different Bundle for instances from a different module") {
                let firstBundle = Bundle(of: NSObject())
                let secondBundle = Bundle(of: DateFormatter())
                expect(firstBundle).toNot(equal(secondBundle))
            }

        }

    }

}
