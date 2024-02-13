//
//  TransferAmountView.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 26.01.24.
//
import UIKit
import NarHubUIKit

protocol TransferAmountButtonDelegate: AnyObject {
    func onButtonSelected(sender: UIButton)
}

class TransferAmountButton: UIButton, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    weak var delegate: TransferAmountButtonDelegate?
    
    fileprivate func setupUI(amount: String) {
//        var buttonConfiguration = UIButton.Configuration.borderedTinted()
//        buttonConfiguration.title = "\(amount) ₼"
//        buttonConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
//        buttonConfiguration.baseBackgroundColor = self.isSelected ? adaptiveColor(.selectedBtnColor) :  .white
//        buttonConfiguration.background.cornerRadius = 28
//        
        self.setTitle("\(amount) ₼", for: .normal)
        self.backgroundColor = self.isSelected ? adaptiveColor(.selectedBtnColor) :  .white
        self.layer.cornerRadius = 28
        self.layer.borderColor = self.isSelected ? adaptiveColor(.mainColor).cgColor : UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.setTitleColor( self.isSelected ? adaptiveColor(.mainColor) : .black, for: .normal)
        
        self.contentEdgeInsets = .init(top: 16, left: 16, bottom: 16, right: 16)
        
        self.addTarget(self, action: #selector(onTap(_:)), for: .touchUpInside)
    }
    
    
    //MARK: Init
    
    init(transferAmount: Double) {
        let amount = transferAmount.convertToTwoDecimalPlaces()
        super.init(frame: .zero)
        
        self.setupUI(amount: amount)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    var isButtonSelected: Bool? {
        didSet {
            self.backgroundColor = adaptiveColor(.selectedBtnColor)
            self.layer.borderColor = adaptiveColor(.mainColor).cgColor
            self.setTitleColor(adaptiveColor(.mainColor), for: .normal)
        }
    }

    
    @objc func onTap(_ sender: UIButton) {
        delegate?.onButtonSelected(sender: sender)
    }
}
