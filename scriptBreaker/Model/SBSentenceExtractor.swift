//
//  SBSentenceExtractor.swift
//  scriptBreaker
//
//  Created by carus on 22/2/2022.
//

import Foundation

class SBSentenceExtractor {
    class func extract(_ script: String) -> [SBSentence] {
        let sentenceList = script.split(usingRegex: "[.!?]").map({$0.trimmingCharacters(in: .whitespaces)}).filter({$0 != ""}).compactMap({SBSentence.init($0)})
        return sentenceList
    }
}
