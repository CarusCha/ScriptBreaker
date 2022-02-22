//
//  SBSentence.swift
//  scriptBreaker
//
//  Created by carus on 22/2/2022.
//

import Foundation

class SBSentence {
    var wordList: [SBWord]?
    
    init(_ sentence: String) {
        self.wordList = sentence.matches(for: "[A-Za-z]+").compactMap({ str in
            let word = SBWord(str)
            word.sentence = self
            return word
        })
    }

}
