import Foundation
import Testing
@testable import Bedrock

@Suite("String capitalization functions")
struct StringTests {

    @Test("Capitalizes the first character correctly")
    func capitalizingFirstLetter() {
        let string = "goose"
        let capitalized = string.bedrock.capitalizingFirstLetter()
        #expect(capitalized == "Goose")

        let capitalizedAgain = capitalized.bedrock.capitalizingFirstLetter()
        #expect(capitalizedAgain == "Goose")

        let empty = ""
        let capitalizedEmpty = empty.bedrock.capitalizingFirstLetter()
        #expect(capitalizedEmpty == "")
    }

}
