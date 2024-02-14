//
//  PhoneNumberViewCell.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 31.01.24.
//

import UIKit

class PhoneNumberViewCell: UITableViewCell {

    static var reuseIdentifier = "PhoneNumberViewCell"
    
    private lazy var phoneNumberLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        return lbl
    }()
    
    private lazy var chooseButton: UIImageView = {
        let imageView = UIImageView()
        var image = UIImage(systemName: "chevron.forward")!
        image = image.withTintColor(.darkGray, renderingMode: .alwaysOriginal)
        imageView.image = image
        return imageView
    }()
    
   
    //MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubviews()
        self.addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.addSubview(self.phoneNumberLabel)
        self.addSubview(self.chooseButton)
    }
    
    
    private func addConstraints() {
        
        self.phoneNumberLabel.snp.updateConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.bottom.equalToSuperview()
        }
        self.chooseButton.snp.updateConstraints { make in
            make.leading.equalTo(self.phoneNumberLabel.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
            make.width.height.equalTo(16)
            make.centerY.equalToSuperview()
        }
    }
    
    public func configure(with phoneNumber: String) {
        self.phoneNumberLabel.text = phoneNumber
    }
}
