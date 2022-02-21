//
//  SBVocabulary.swift
//  scriptBreaker
//
//  Created by carus on 22/2/2022.
//

import Foundation

struct SBVocabulary {
    enum WordClass {
        case noun
        case verb
        case adverb
        case adjective
    }
    
    var word: String
    var sentense: String
    var meaning: String?
    var wordClass: WordClass?
}
