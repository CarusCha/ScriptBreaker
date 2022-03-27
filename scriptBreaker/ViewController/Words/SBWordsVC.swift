//
//  SBWordsVC.swift
//  scriptBreaker
//
//  Created by carus on 1/3/2022.
//

import UIKit
import CoreData

class SBWordsVC: UIViewController {
    
    enum ViewType {
        case add
        case list
        
        var title: String {
            switch self {
            case .add: return "Save".localized
            case .list: return "New".localized
            }
        }
    }
    
    @IBOutlet weak var wordsTableView: SBWordsTableView!
    
    var type: ViewType = .list
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Word List".localized
        navigationController?.navigationBar.prefersLargeTitles = true
        wordsTableView.topView.isHidden = true
        wordsTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        wordsTableView.topView.button.setTitle(type.title, for: .normal)
        if type == .list {
            fetchCoreDataWord()
        }
    }
    
    func setContent(_ wordList: [SBWord]?) {
        wordsTableView.wordList = wordList
    }
    
    
    func saveCoreDataWord() {
        let context = SBCoreDataManager.shared.persistentContainer.viewContext
        if let entity = NSEntityDescription.entity(forEntityName: "Word", in: context) {
            for newWord in wordsTableView.wordList ?? [] {
                let word = NSManagedObject(entity: entity, insertInto: context)
                word.setValue(newWord.text, forKey: "text")
                
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func fetchCoreDataWord() {
        let context = SBCoreDataManager.shared.persistentContainer.viewContext
        do {
            let wordList = try context.fetch(Word.fetchRequest()) as! [Word]
            setContent(wordList.map({ SBWord($0)}))
        } catch {
            print(error.localizedDescription)
        }
    }
    

    

}


extension SBWordsVC: SBWordsTableViewDelegate {
    func didPressTopButton() {
        if type == .add {
            // TODO: - Show loading and unable interaction
            saveCoreDataWord()
            dismiss(animated: true)
        }

        
    }
    
    func didSetWords(_ wordsCount: Int) {
        wordsTableView.topView.titleLB.text = "Total \(wordsCount)"
        wordsTableView.reloadData()
        wordsTableView.topView.isHidden = false
    }
}
