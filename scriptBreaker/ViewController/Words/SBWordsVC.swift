//
//  SBWordsVC.swift
//  scriptBreaker
//
//  Created by carus on 1/3/2022.
//

import UIKit

class SBWordsVC: UIViewController {

    @IBOutlet weak var wordsTableView: SBWordsTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Word List".localized
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    

}


