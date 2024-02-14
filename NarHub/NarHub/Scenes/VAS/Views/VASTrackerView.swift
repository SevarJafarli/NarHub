//
//  VASTrackerView.swift
//  NarHub
//
//  Created by Sevar Jafarli on 14.02.24.
//

import UIKit
import NarHubUIKit

class VASTrackerView: UIProgressView , ThemeableView {
    var theme: ThemeProvider = App.theme
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.progressTintColor = adaptiveColor(.mainColor)
        self.trackTintColor = adaptiveColor(.labelColor)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
