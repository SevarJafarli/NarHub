//
//  UserContactsViewCell.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 31.01.24.
//

import UIKit
import NarHubUIKit

class UserContactsViewCell: UITableViewCell, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    
    static var reuseIdentifier = "UserContactsViewCell"
    
    private let backView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var contactName: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.boldTitleSize18.fontStyle
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var contactPhoneNumber: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.boldTitleSize18.fontStyle
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var contactInitialView: UIView = {
        let view = UIView()
        view.backgroundColor = adaptiveColor(.selectedBtnColor)
        view.layer.cornerRadius = 15
        view.layer.borderColor = adaptiveColor(.mainColor).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var contactInitialLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.boldTitleSize18.fontStyle
        lbl.textColor = adaptiveColor(.mainColor)
        return lbl
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
        self.contactInitialView.addSubview(self.contactInitialLabel)
        self.backView.addSubview(self.contactInitialView)
        self.backView.addSubview(self.contactName)
        self.backView.addSubview(self.contactPhoneNumber)
        self.addSubview(self.backView)
    }
    
    
    private func addConstraints() {
        self.backView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.contactInitialView.snp.updateConstraints { make in
            make.leading.equalTo(self.backView).offset(16)
            make.top.equalTo(self.backView).offset(8)
            make.bottom.equalTo(self.backView).offset(-8)
            make.width.equalTo(60)
        }
        
        self.contactInitialLabel.snp.updateConstraints { make in
            make.center.equalTo(self.contactInitialView)
        }
        
        self.contactName.snp.updateConstraints { make in
            make.leading.equalTo(self.contactInitialView.snp.trailing).offset(8)
            make.trailing.equalTo(self.backView).offset(-8)
            make.top.equalTo(self.backView).offset(8)
        }
        
        self.contactPhoneNumber.snp.updateConstraints { make in
            make.leading.equalTo(self.contactInitialView.snp.trailing).offset(8)
            make.trailing.equalTo(self.backView).offset(-8)
            make.top.equalTo(self.contactName.snp.bottom).offset(8)
            make.bottom.equalTo(self.backView).offset(-8)
        }
    }
    
    public func configure(with model: UserContactModel) {
        let nameInitial = model.firstName.prefix(1)
        let surnameInitial = model.lastName.prefix(1)
        
        self.contactInitialLabel.text = "\(nameInitial)\(surnameInitial)"
        self.contactName.text = "\(model.firstName) \(model.lastName)"
        var contactPhoneNumberText = ""
        if model.phoneNumbers.count > 1 {
            contactPhoneNumberText = "\(model.phoneNumbers.first!) and \(model.phoneNumbers.count - 1) more"
        }
        else {
            contactPhoneNumberText = model.phoneNumbers.first!
        }
        self.contactPhoneNumber.text = contactPhoneNumberText
    }
}
