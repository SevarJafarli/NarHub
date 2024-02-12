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

class TransferAmountButton: UIButton {
    weak var delegate: TransferAmountButtonDelegate?
    
    fileprivate func setupUI(amount: String) {
        self.setTitle("\(amount) ₼", for: .normal)
        self.backgroundColor = self.isSelected ? UIColor(named: ColorStyle.selectedBtnColor.rawValue) :  .white
        self.layer.cornerRadius = 28
        self.layer.borderColor = self.isSelected ? UIColor(named: ColorStyle.mainColor.rawValue)?.cgColor : UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.setTitleColor( self.isSelected ? UIColor(named: ColorStyle.mainColor.rawValue) : .black, for: .normal)
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
    
    public func changeButtonState() {
        self.backgroundColor = self.isSelected ? UIColor(named:ColorStyle.selectedBtnColor.rawValue) :  .white
        self.layer.borderColor = self.isSelected ? UIColor(named: ColorStyle.mainColor.rawValue)!.cgColor : UIColor.white.cgColor
        
        self.setTitleColor( self.isSelected ? UIColor(named: ColorStyle.mainColor.rawValue) : .black, for: .normal)
        
    }
    @objc func onTap(_ sender: UIButton) {
        delegate?.onButtonSelected(sender: sender)
    }
}
