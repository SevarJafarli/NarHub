//
//  RoundedButton.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 23.01.24.
//

import UIKit
import NarHubUIKit

class RoundedButton: UIButton, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupButton()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupButton() {
        self.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: 58, height: 58)
        self.backgroundColor = adaptiveColor(.mainColor)
        self.layer.cornerRadius = 28
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.setImage(AppAssets.program.load()?.resized(to: CGSize(width: 24, height: 24)), for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
    }
}
