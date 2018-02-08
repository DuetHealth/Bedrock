
import Foundation
import Nimble
import Quick

class StringSpec: QuickSpec {

    override func spec() {

        describe ("String capitalization functions") {
            it ("Capitalizes the first character correctly") {
                let string = "goose"
                let capitalized = string.bedrock.capitalizingFirstLetter()
                expect(capitalized).to(equal("Goose"))

                let capitalizedAgain = capitalized.bedrock.capitalizingFirstLetter()
                expect(capitalizedAgain).to(equal("Goose"))

                let empty = ""
                let capitalizedEmpty = empty.bedrock.capitalizingFirstLetter()
                expect(capitalizedEmpty).to(equal(""))
            }

        }

    }

}
