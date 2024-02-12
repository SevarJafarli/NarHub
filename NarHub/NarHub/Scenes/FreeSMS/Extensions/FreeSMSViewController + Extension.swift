//
//  FreeSMSViewController + Extension.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 08.02.24.
//

import UIKit

///Adjust bottom inset of button with the notification of opening and closing of keyboard

extension FreeSMSViewController {
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if self.mainView!.phoneNumberTextField.phoneTextField.isEditing || self.mainView!.messageTextView.textView.isFocused {
               moveViewWithKeyboard(notification: notification, keyboardWillShow: true)
           }
       }
       
       @objc func keyboardWillHide(_ notification: NSNotification) {
           moveViewWithKeyboard(notification: notification, keyboardWillShow: false)
       }
       
    private func moveViewWithKeyboard(notification: NSNotification, keyboardWillShow: Bool) {
        // Keyboard's size
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let keyboardHeight = keyboardSize.height
        
        // Keyboard's animation duration
        let keyboardDuration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        
        // Keyboard's animation curve
        let keyboardCurve = UIView.AnimationCurve(rawValue: notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! Int)!
        
        // Change the constant
        if keyboardWillShow {
            let safeAreaExists = (self.view?.window?.safeAreaInsets.bottom != 0) // Check if safe area exists
            let bottomConstant: CGFloat = 12
            if safeAreaExists {
            
                self.mainView!.sendButton.snp.updateConstraints { make in
                    make.bottom.equalTo(mainView!.safeAreaLayoutGuide).offset(-(keyboardHeight + bottomConstant))
                }
            }
            else {
                self.mainView!.sendButton.snp.updateConstraints { make in
                    make.bottom.equalTo(mainView!.safeAreaLayoutGuide).offset(-(keyboardHeight + bottomConstant))
                }
               
            }
        }
        else {
            self.mainView!.sendButton.snp.updateConstraints { make in
                make.bottom.equalTo(mainView!.safeAreaLayoutGuide).offset(-12)
            }
        }
        
        // Animate the view the same way the keyboard animates
        let animator = UIViewPropertyAnimator(duration: keyboardDuration, curve: keyboardCurve) { [weak self] in
            // Update Constraints
            self?.view.layoutIfNeeded()
        }
        
        // Perform the animation
        animator.startAnimation()
    }
}


