//
//  LargeFilledButton.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 26.01.24.
//

import UIKit
import NarHubUIKit

protocol LargeFilledButtonDelegate: AnyObject {
    func onButtonTap(sender: UIButton)
}
class LargeFilledButton: UIButton, ThemeableView {
    weak var delegate: LargeFilledButtonDelegate?
    
    var theme: ThemeProvider = App.theme
    
    init(isButtonEnabled: Bool, title: String) {
        super.init(frame: .zero)
        self.isEnabled = isButtonEnabled
        self.setTitle(title, for: .normal)
        self.backgroundColor = isButtonEnabled ? adaptiveColor(.mainColor) : adaptiveColor(.disabledBtnColor)
        self.layer.cornerRadius = 28
        self.setTitleColor(isButtonEnabled ? .white : adaptiveColor(.labelColor), for: .normal)
        self.addTarget(self, action: #selector(onTap(_:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    @objc func onTap(_ sender: UIButton) {
        delegate?.onButtonTap(sender: sender)
        
    }
    
    public func changeButtonState(isEnabled: Bool) {
        self.isEnabled = isEnabled
        self.backgroundColor = isEnabled ? adaptiveColor(.mainColor) : adaptiveColor(.disabledBtnColor)

        self.setTitleColor(isEnabled ? .white: adaptiveColor(.labelColor), for: .normal)
        
    }
}
