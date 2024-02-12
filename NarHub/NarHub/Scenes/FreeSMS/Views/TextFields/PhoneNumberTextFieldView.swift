//
//  PhoneNumberTextField.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 26.01.24.
//

import UIKit
import NarHubUIKit
protocol PhoneNumberTextFieldViewDelegate: AnyObject {
    func textFieldDidTextChange(text: String)
    func openContacts()
}

class PhoneNumberTextFieldView: UIView {
    
    weak var delegate: PhoneNumberTextFieldViewDelegate?
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var prefixLabel: UILabel = {
        let label = UILabel()
        label.text = "+994"
        label.font = AppFonts.boldBodySize16.fontStyle
        label.textColor = .black
        return label
    }()
    
    lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.keyboardType = .numberPad
        textField.tintColor = UIColor(named: ColorStyle.mainColor.rawValue)
        textField.textColor = .black
        textField.font = AppFonts.boldBodySize16.fontStyle
        return textField
    }()

    private lazy var contactBtn: UIButton = {
        let btn = UIButton()
        btn.setImage( AppAssets.contact.load(), for: .normal)
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(openContacts), for: .touchUpInside)
        return btn
    }()
    
    private func addSubviews() {
        self.hStackView.addArrangedSubview(prefixLabel)
        self.hStackView.addArrangedSubview(phoneTextField)
        self.hStackView.addArrangedSubview(contactBtn)
        self.backView.addSubview(self.hStackView)
        self.addSubview(self.backView)
        
    }
    
    private func addConstraints() {
        self.backView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(56)
        }

        self.hStackView.snp.updateConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        self.prefixLabel.snp.updateConstraints { make in
            make.width.equalTo(50)

        }
        self.contactBtn.snp.updateConstraints { make in
            make.width.equalTo(24)
          
        }
    }

    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.addConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func openContacts() {
        self.delegate?.openContacts()
    }
}


//MARK: UITextFieldDelegate

extension PhoneNumberTextFieldView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        /// format phone number
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = newString.changeStringToNumberFormat(with: StringFormats.phoneNumber.rawValue)
        
        delegate?.textFieldDidTextChange(text: textField.text!)
        return false
        
    }
}

