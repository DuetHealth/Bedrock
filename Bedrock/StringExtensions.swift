//
//  StringExtensions.swift
//  Bedrock
//
//  Created by sylvester watts on 2/2/18.
//  Copyright © 2018 Duet Health LLC. All rights reserved.
//

import Foundation

public extension String {

    fileprivate struct RegexMixin {
        // Crashing is probably preferable to silently failing since this would primarily be used in
        // esoteric contexts (YouTube JS) where limiting confounding factors is beneficial to debugging.
        static let youtubeIDRegex = try! NSRegularExpression(pattern: "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)", options: .caseInsensitive)
    }

    /// Given a valid YouTube video URL as a `String`, extracts and returns the unique identifier for
    /// the video.
    ///
    /// - Returns: Either the video identifier or `.none`.
    public static func dhk_youtubeVideoID(from url: String) -> String? {
        switch RegexMixin.youtubeIDRegex.firstMatch(in: url, range: NSMakeRange(0, url.count)) {
        case .some(let result): return (url as NSString).substring(with: result.range)
        case .none: return nil
        }
    }

    /// Gets the length of the string as a signed integer.
    @available(*, deprecated, message: "use String.count instead.")
    public var dhk_length: Int {
        return characters.count
    }

    /// Returns the NSString definition of booleanValue of String
    public var boolValueFromString: Bool {
        return NSString(string: self).boolValue
    }

    /// Returns a new string with the first character capitalized
    public func capitalizingFirstLetter() -> String {
        let first = String(prefix(1)).capitalized
        let other = String(dropFirst())
        return first + other
    }

    /// Capitalizes the first character of the string
    public mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }

    /// Capitalizes first letter of the first word of each sentence
    public func capitalizeFirstWordInSentences() -> String {
        var result = self
        for _ in 0...2 {
            result = result.capitalizeSentenceSingleIteration()
        }
        return result
    }

    private func capitalizeSentenceSingleIteration() -> String {
        var result = ""
        self.capitalized.enumerateSubstrings(in: self.startIndex..<self.endIndex, options: .bySentences) { (_, range, _, _) in
            var substring = self[range]
            let first = substring.remove(at: substring.startIndex)
            result += String(first).uppercased() + substring
        }
        return result
    }

}
