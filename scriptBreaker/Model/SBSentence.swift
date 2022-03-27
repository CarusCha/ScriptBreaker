//
//  SBSentence.swift
//  scriptBreaker
//
//  Created by carus on 22/2/2022.
//

import Foundation

class SBSentence {
    var referenceID: String = UUID().uuidString
    var text: String
    weak var paragraph: SBParagraph?
    var words: [SBWord]?
    
    init(_ sentence: String, paragraph: SBParagraph) {
        self.text = sentence
        self.paragraph = paragraph
        self.words = toWords()
    }

    func toWords() -> [SBWord]? {
        // How to handle apostrophe?
        self.text.matches(for: "[A-Z]+('+[A-Z])?").compactMap{SBWord($0, sentence: self)}
    }
}
