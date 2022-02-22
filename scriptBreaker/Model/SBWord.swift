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
    
    var word: String?
    weak var sentence: SBSentence?
    var meaning: String?
    var phrase: String?
    var wordClass: WordClass?
    
    init(_ word: String) {
        self.word = word
    }
}
