//
//  SBInputScriptVC.swift
//  scriptBreaker
//
//  Created by carus on 20/2/2022.
//

import UIKit

class SBInputScriptVC: UIViewController {

    @IBOutlet weak var scriptTV: UITextView!
    @IBOutlet weak var breakDownBTNBottom: NSLayoutConstraint!
    @IBOutlet weak var breakDownBTN: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Input Script".localized
        navigationController?.navigationBar.prefersLargeTitles = true
        
        breakDownBTN.addTarget(self, action: #selector(breakDownPressed), for: .touchUpInside)
        
        setUI()
        hideKeyboardWhenTappedAround()
        
        let breakDownBTNBottomValue: CGFloat = breakDownBTNBottom.constant
        observeKeyboardNotification { [weak self] isShow, keyboardSize in
            if isShow {
                self?.breakDownBTNBottom.constant = keyboardSize.height + breakDownBTNBottomValue
            } else {
                self?.breakDownBTNBottom.constant = breakDownBTNBottomValue
            }
        }

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardNotification()
    }
    
    
    func setUI() {
        scriptTV.layer.borderWidth = 1
        scriptTV.layer.borderColor = UIColor.gray.cgColor
        scriptTV.layer.cornerRadius = 6
    }
    
    
    @objc func breakDownPressed() {
        let paragraph = SBParagraph(scriptTV.text)
        if let wordsVC = UIStoryboard.getViewController("SBWordsSB", viewControllerIdentifier: "SBWordsVC") as? SBWordsVC {
            
            self.modalTransitionStyle = .partialCurl
            self.present(wordsVC, animated: true) {
                wordsVC.setContent(.add, paragraph: paragraph)
            }
        }
        
    }
    
    

}



