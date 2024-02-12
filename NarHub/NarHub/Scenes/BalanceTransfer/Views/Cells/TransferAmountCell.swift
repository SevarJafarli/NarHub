//
//  TransferAmountCell.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 06.02.24.
//

import UIKit
import NarHubUIKit
class TransferAmountCell: UICollectionViewCell {
    
    static var reuseIdentifier = "TransferAmountCell"

    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = AppFonts.boldTitleSize18.fontStyle
        return lbl
    }()
    
    
    var isButtonSelected: Bool? {
        didSet {
            self.contentView.backgroundColor = .red
        }
    }
    fileprivate func configureContentView() {
        self.contentView.backgroundColor = UIColor.white
        self.contentView.layer.cornerRadius = 28
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.white.cgColor
    }
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        self.configureContentView()
        self.addSubviews()
        self.addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.contentView.addSubview(self.titleLabel)
    }
    
    private func addConstraints() {
        self.titleLabel.snp.updateConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    //MARK: Public
    
    public func configure(with transferAmount: String) {
        self.titleLabel.text = "\(transferAmount) ₼ "
    }
    
    public func changeState(isSelected: Bool) {
        print("Change state")
        self.contentView.backgroundColor = self.isSelected ? UIColor(named: ColorStyle.selectedBtnColor.rawValue) :  .white
        self.contentView.layer.borderColor = isSelected ? UIColor(named: ColorStyle.mainColor.rawValue)?.cgColor : UIColor.white.cgColor
        
        self.titleLabel.textColor = self.isSelected ? UIColor(named: ColorStyle.mainColor.rawValue) : .black
    }
}
