//
//  Extension.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 30.01.24.
//

import UIKit
import FittedSheets

public extension UIView {
    
    func roundedView(size: Int) {
        self.frame.size = CGSize(width: size, height: size)
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.masksToBounds = true
    }
    
    func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
        
        if #available(iOS 11, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = corners
        } else {
            var cornerMask = UIRectCorner()
            if(corners.contains(.layerMinXMinYCorner)){
                cornerMask.insert(.topLeft)
            }
            if(corners.contains(.layerMaxXMinYCorner)){
                cornerMask.insert(.topRight)
            }
            if(corners.contains(.layerMinXMaxYCorner)){
                cornerMask.insert(.bottomLeft)
            }
            if(corners.contains(.layerMaxXMaxYCorner)){
                cornerMask.insert(.bottomRight)
            }
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: cornerMask, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
}

//MARK: UIGestureRecognizerDelegate

extension UIViewController: UIGestureRecognizerDelegate {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.delegate = self
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    ///enable recognize multiple gestures at the same time
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

final class BindableGestureRecognizer: UITapGestureRecognizer {
    private var action: () -> Void

    init(action: @escaping () -> Void) {
        self.action = action
        super.init(target: nil, action: nil)
        self.addTarget(self, action: #selector(execute))
    }

    @objc private func execute() {
        action()
    }
}

extension UIView {
    func addTapGesture(tapNumber: Int = 1, _ closure: (() -> Void)?) {
        guard let closure = closure else { return }

        let tap = BindableGestureRecognizer(action: closure)
        tap.numberOfTapsRequired = tapNumber
        addGestureRecognizer(tap)

        isUserInteractionEnabled = true
    }
}

//MARK: Bottom sheet

extension UIViewController {
    func showBottomUp(_ alertView: UIViewController, sizes: [SheetSize] = [.intrinsic] ) {
        
        var options = SheetOptions()
        options.pullBarHeight = 0
        options.useInlineMode = false
        options.shrinkPresentingViewController = false
        let sheet = SheetViewController(
            controller: alertView,
            sizes: sizes,
            options: options)
        sheet.dismissOnPull = true
        sheet.dismissOnOverlayTap = true
        sheet.cornerRadius = 18
        sheet.allowPullingPastMaxHeight = false
        sheet.hasBlurBackground = false

        self.present(sheet, animated: true)
    }
}
