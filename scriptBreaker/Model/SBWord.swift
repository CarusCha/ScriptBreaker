//
//  SBWord.swift
//  scriptBreaker
//
//  Created by carus on 22/2/2022.
//

import Foundation

class SBWord {
    enum WordClass: Int {
        case noun
        case verb
        case adverb
        case adjective
    }
    
    var referenceID: String = UUID().uuidString
    var text: String?
    var meaning: String?
    var wordClass: WordClass?
    weak var sentence: SBSentence?
    
    init(_ word: String, sentence: SBSentence?) {
        self.text = word.lowercased()
        self.sentence = sentence
        
    }
    
    init(_ word: Word) {
        self.text = word.text
    }
}


