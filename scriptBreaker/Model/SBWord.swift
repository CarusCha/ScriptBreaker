//
//  SBWord.swift
//  scriptBreaker
//
//  Created by carus on 22/2/2022.
//

import Foundation

class SBWord {
    enum WordClass {
        case noun
        case verb
        case adverb
        case adjective
    }
    
    var referenceID: String = UUID().uuidString
    var text: String?
    var meaning: String?
    var wordClass: WordClass?
    weak var paragraph: SBParagraph?
    weak var sentence: SBSentence?
    
    init(_ word: String, paragraph: SBParagraph?, sentence: SBSentence?) {
        self.text = word.lowercased()
        self.paragraph = paragraph
        self.sentence = sentence
    }
}
