//
//  StoryProgressBar.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 04.02.24.
//

import UIKit
import NarHubUIKit
class StoryProgressBar: UIProgressView {
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.trackTintColor = UIColor(named: ColorStyle.darkGrayLabelColor.rawValue)
        self.tintColor = UIColor(named: ColorStyle.mainColor.rawValue)
       
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
