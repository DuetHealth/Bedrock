import Foundation
import Testing
@testable import Bedrock

@Suite("Initializing bundles from instances")
struct BundleTests {

    @Test("Returns the same Bundle for instances from the same module")
    func sameBundleForSameModule() {
        let firstBundle = Bundle(of: DateFormatter())
        let secondBundle = Bundle(of: NumberFormatter())
        #expect(firstBundle == secondBundle)
    }

    @Test("Returns a different Bundle for instances from a different module")
    func differentBundleForDifferentModule() {
        let firstBundle = Bundle(of: NSObject())
        let secondBundle = Bundle(of: DateFormatter())
        #expect(firstBundle != secondBundle)
    }

}
