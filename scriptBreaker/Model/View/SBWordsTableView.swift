//
//  SBWordsTableView.swift
//  scriptBreaker
//
//  Created by carus on 3/3/2022.
//

import UIKit

protocol SBWordsTableViewDelegate {
    func didSetParagraph(_ wordList: [SBWord])
    
}

class SBWordsTableView: UIView {
    
    var tableView: UITableView!
    var paragraph: SBParagraph? {
        didSet {
            wordList = paragraph?.sentences?.compactMap{$0.words}.flatMap{$0}
            delegate?.didSetParagraph(wordList ?? [])
        }
    }
    public private(set) var wordList: [SBWord]?
    
    var delegate: SBWordsTableViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewInit()
    }
    
    func viewInit() {
        tableView = UITableView()
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "SBWordsTableViewCell", bundle: nil), forCellReuseIdentifier: "SBWordsTableViewCell")
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    deinit {
        print("deinit")
    }
}


extension SBWordsTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SBWordsTableViewCell", for: indexPath) as! SBWordsTableViewCell
        if let word = wordList?[indexPath.row] {
            cell.wordLabel.text = word.text
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
