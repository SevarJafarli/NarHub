//
//  StoryProgressBar.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 04.02.24.
//

import UIKit
import NarHubUIKit

class StoryProgressBar: UIProgressView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.trackTintColor = adaptiveColor(.darkGrayLabelColor)
        self.tintColor = adaptiveColor(.mainColor)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
