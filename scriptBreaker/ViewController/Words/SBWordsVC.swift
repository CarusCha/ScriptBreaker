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
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var totalNumLB: UILabel!
    @IBOutlet weak var saveBTN: UIButton!
//    var viewType: ViewType = .list
    
    @IBOutlet weak var wordsTableView: SBWordsTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Word List".localized
        navigationController?.navigationBar.prefersLargeTitles = true
        saveBTN.setTitle("Save".localized, for: .normal)
        topView.isHidden = true
    }
    
    func setContent(_ viewType: ViewType, paragraph: SBParagraph?) {
        topView.isHidden = viewType == .list // TODO: - Move topView to SBWordsTableView..
        wordsTableView.delegate = self
        wordsTableView.paragraph = paragraph
    }
    
    @IBAction func saveBTNPressed(_ sender: UIButton) {
        
    }
    

}




extension SBWordsVC: SBWordsTableViewDelegate {
    func didSetParagraph(_ wordList: [SBWord]) {
        totalNumLB.text = "Total \(wordList.count)"
        wordsTableView.reloadData()
    }
}
