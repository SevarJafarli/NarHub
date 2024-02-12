//
//  Colors.swift
//  NarHubUIKit
//
//  Created by Sevar Jafarli on 05.02.24.
//

import UIKit

public enum ColorStyle: String, CaseIterable {
    
    case mainColor = "MainColor"
    case labelColor = "AppLabelColor"
    case black =  "AppBlackColor"
    case bgColor = "AppBGColor"
    case disabledBtnColor = "DisabledBtnColor"
    case borderColor = "CardBorderColor"
    case selectedBtnColor = "SelectedButtonColor"
    case darkGrayLabelColor = "DarkGrayLabelColor"
}

extension ColorStyle {
    func load() -> UIColor? {
        if #available(iOS 13.0, *) {
            return UIColor(named: self.rawValue, in: bundle, compatibleWith: .current)
        } else {
            return UIColor(named: self.rawValue, in: bundle, compatibleWith: nil)
        }
    }
}

