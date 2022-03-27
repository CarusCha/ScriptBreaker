//
//  SBWordsTableView.swift
//  scriptBreaker
//
//  Created by carus on 3/3/2022.
//

import UIKit

protocol SBWordsTableViewDelegate: AnyObject {
    func didSetWords(_ wordsCount: Int)
    func didPressTopButton()
}

class SBWordsTableView: UIView {
    
    var tableView: UITableView!
    var topView: LabelAndButtonView!
    var wordList: [SBWord]? {
        didSet {
            delegate?.didSetWords(wordList?.count ?? 0)
        }
    }
    
    weak var delegate: SBWordsTableViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewInit()
    }
    
    func viewInit() {
        // Set TopView
        topView = LabelAndButtonView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topView)
        topView.button.addTarget(self, action: #selector(topButtonPressed), for: .touchUpInside)

        // Set TableView
        tableView = UITableView()
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "SBWordsTableViewCell", bundle: nil), forCellReuseIdentifier: "SBWordsTableViewCell")
        
        // Constraints
        NSLayoutConstraint.activate([
            topView.heightAnchor.constraint(equalToConstant: 40),
            topView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topView.leftAnchor.constraint(equalTo: self.leftAnchor),
            topView.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            tableView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
        

        
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    @objc func topButtonPressed() {
        delegate?.didPressTopButton()
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
