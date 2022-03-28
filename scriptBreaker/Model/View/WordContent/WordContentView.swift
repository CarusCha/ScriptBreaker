//
//  WordContentView.swift
//  scriptBreaker
//
//  Created by carus on 28/3/2022.
//

import UIKit

class WordContentView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var numberLB: UILabel!
    @IBOutlet weak var wordLB: UILabel!
    @IBOutlet weak var meaningTF: UITextField!
    @IBOutlet weak var sepaView: UIView!
    @IBOutlet weak var meaningLB: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    func commonInit() {
        Bundle.main.loadNibNamed("WordContentView", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        meaningLB.isHidden = true
    }
    
    func setForHeader() {
        numberLB.isHidden = true
        meaningTF.isHidden = true
        meaningLB.isHidden = false
        
        wordLB.text = "Word".localized
        wordLB.textColor = .white
        meaningLB.text = "Meaning".localized
        meaningLB.textColor = .white
        sepaView.backgroundColor = .white
        contentView.backgroundColor = .systemGray
        
    }
}
