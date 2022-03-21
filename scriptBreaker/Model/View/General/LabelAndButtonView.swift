//
//  LabelAndButtonView.swift
//  scriptBreaker
//
//  Created by carus on 22/3/2022.
//

import UIKit

class LabelAndButtonView: UIView {

    var titleLB: UILabel!
    var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewInit() {
        titleLB = UILabel()
        titleLB.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLB)
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 6
        addSubview(button)
        
        NSLayoutConstraint.activate([
            titleLB.topAnchor.constraint(equalTo: self.topAnchor),
            titleLB.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleLB.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            titleLB.rightAnchor.constraint(equalTo: button.leftAnchor, constant: -10),
            button.widthAnchor.constraint(equalToConstant: 80),
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10)
            
        ])
        
    }
}
