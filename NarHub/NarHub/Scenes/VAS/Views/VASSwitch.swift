//
//  VASSwitch.swift
//  NarHub
//
//  Created by Sevar Jafarli on 14.02.24.
//

import UIKit
import NarHubUIKit

class VASSwitch: UISwitch, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isOn = true
        self.onTintColor = adaptiveColor(.mainColor)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
