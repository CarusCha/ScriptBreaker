//
//  ViewController+Extension.swift
//  scriptBreaker
//
//  Created by carus on 21/2/2022.
//

import UIKit

extension UIViewController {
    
    // MARK: - Hide Keyboard
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    // MARK: - Keyboard Observer
    func observeKeyboardNotification(_ keyboardWill: @escaping (_ isShow: Bool, _ keyboardSize: CGRect) -> Void) {
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { notification in
            print("keyboardWillShow")
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                keyboardWill(true, keyboardSize)
            }
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { notification in
            print("keyboardWillHide")
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                keyboardWill(false, keyboardSize)
            }
        }
    }
    
    func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillShowNotification)
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillHideNotification)
    }
}
