//
//  SBTabBarController.swift
//  scriptBreaker
//
//  Created by carus on 28/2/2022.
//

import UIKit

class SBTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()
    }

    
    func setupViewControllers() {
        
        let inputScriptVC = UIStoryboard.getViewController("SBInputScriptSB", viewControllerIdentifier: "SBInputScriptVC", navigation: true)
        let wordListVC = UIStoryboard.getViewController("SBWordsSB", viewControllerIdentifier: "SBWordsVC", navigation: true)
        
        viewControllers = [
            inputScriptVC,
            wordListVC
        ]
        
        for item in self.tabBar.items ?? [] {
            item.title = "Title"
            item.image = UIImage(systemName: "house")
        }
    }



}




