//
//  SBWordsTableView.swift
//  scriptBreaker
//
//  Created by carus on 3/3/2022.
//

import UIKit

class SBWordsTableView: UIView {
    
    var tableView: UITableView!
    var paragraph: SBParagraph?
    var wordList: [SBWord]? {
        return paragraph?.sentences?.compactMap{$0.words}.flatMap{$0}
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewInit()
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    deinit {
        
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
    
    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 50
//    }
//
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView()
//        return footerView
//    }
    
    
    
    

    
    
}
