//
//  SBWordsTableViewCell.swift
//  scriptBreaker
//
//  Created by carus on 3/3/2022.
//

import UIKit

class SBWordsTableViewCell: UITableViewCell {

    @IBOutlet weak var wordLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
