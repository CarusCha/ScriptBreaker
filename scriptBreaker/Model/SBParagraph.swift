//
//  SBParagraph.swift
//  scriptBreaker
//
//  Created by carus on 3/3/2022.
//

import Foundation

class SBParagraph {
    var referenceID: String = UUID().uuidString
    var text: String?
    var sentences: [SBSentence]?

    init(_ paragraph: String) {
        self.text = paragraph
        self.sentences = toSentences()
    }
    
    func toSentences() -> [SBSentence]? {
        return self.text?.split(usingRegex: "[.!?]").map{$0.trimmingCharacters(in: .whitespaces)}.filter{$0 != ""}.compactMap{SBSentence($0, paragraph: self)}
    }
    
}
