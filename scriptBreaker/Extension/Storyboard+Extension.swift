//
//  Storyboard+Extension.swift
//  scriptBreaker
//
//  Created by carus on 28/2/2022.
//

import UIKit

extension UIStoryboard {
    class func getViewController(_ storyboardName: String, viewControllerIdentifier: String, navigation: Bool? = false) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
        if navigation == true {
            let nav = UINavigationController(rootViewController: vc)
            return nav
            
        } else {
            return vc
        }
    }
}
