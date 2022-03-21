//
//  SBWordsVC.swift
//  scriptBreaker
//
//  Created by carus on 1/3/2022.
//

import UIKit

class SBWordsVC: UIViewController {
    
    enum ViewType {
        case add
        case list
    }
    
    @IBOutlet weak var wordsTableView: SBWordsTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Word List".localized
        navigationController?.navigationBar.prefersLargeTitles = true
        wordsTableView.topView.button.setTitle("Save".localized, for: .normal)
        wordsTableView.topView.isHidden = true
    }
    
    func setContent(_ viewType: ViewType, paragraph: SBParagraph?) {
        wordsTableView.topView.isHidden = viewType == .list
        wordsTableView.delegate = self
        wordsTableView.paragraph = paragraph
    }
    

}


extension SBWordsVC: SBWordsTableViewDelegate {
    func didPressTopButton() {
        print("save")
    }
    
    func didSetParagraph(_ wordList: [SBWord]) {
        wordsTableView.topView.titleLB.text = "Total \(wordList.count)"
        wordsTableView.reloadData()
    }
}
