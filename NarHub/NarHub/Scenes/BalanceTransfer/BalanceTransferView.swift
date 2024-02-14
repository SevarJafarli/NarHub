//
//  BalanceTransferView.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 26.01.24.
//

import UIKit
import NarHubUIKit

protocol BalanceTransferViewDelegate: AnyObject {
    func openContacts()
}

final class BalanceTransferView: UIView, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    weak var delegate: BalanceTransferViewDelegate?
    
    lazy var phoneNumberTextFieldView:  PhoneNumberTextFieldView = {
        let view = PhoneNumberTextFieldView()
        view.delegate = self
        return view
    }()
    
    private lazy var infoView: BalanceTransferInfoView = {
        let view = BalanceTransferInfoView()
        return view
    }()
    
    private lazy var loadingIndicator: LoadingActivityIndicator = {
        let indicator = LoadingActivityIndicator()
        return indicator
    }()
    
    lazy var selectTransferAmountView: SelectTransferAmountView = {
        let view = SelectTransferAmountView()
        return view
    }()
    
    private lazy var transferServiceInfoText: UILabel = {
        let label = UILabel()
        label.text = "Xidmətdən gün ərzində 10 dəfə istifadə etmək olar. Hər bir sorğunun dəyəri 0.10 AZN təşkil edir."
        label.textColor = adaptiveColor(.darkGrayLabelColor)
        label.numberOfLines = 0
        label.font = AppFonts.regularBodySize12.fontStyle
        return label
    }()
    
    private lazy var transferButton: LargeFilledButton = {
        let btn = LargeFilledButton(isButtonEnabled: false, title: "Köçür")
        btn.delegate = self
        return btn
    }()
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.bgColor)
    }
    
    private func addSubviews() {
        self.addSubview(self.phoneNumberTextFieldView)
        self.addSubview(self.loadingIndicator)
        self.addSubview(self.selectTransferAmountView)
        self.addSubview(self.infoView)
        self.addSubview(self.transferServiceInfoText)
        self.addSubview(self.transferButton)
    }
    
    //MARK: Init
    
    init() {
        super.init(frame: .zero)
        self.setupUI()
        self.addSubviews()
        self.addConstraints()
        self.updateSendButtonState()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        
        self.phoneNumberTextFieldView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        self.loadingIndicator.snp.updateConstraints { make in
            make.top.equalTo(self.phoneNumberTextFieldView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        self.selectTransferAmountView.snp.updateConstraints { make in
            make.top.equalTo(self.phoneNumberTextFieldView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
        }
        
        self.infoView.snp.updateConstraints { make in
            make.top.equalTo(self.selectTransferAmountView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            
        }
        self.transferServiceInfoText.snp.updateConstraints { make in
            make.bottom.equalTo(self.transferButton.snp.top).offset(-12)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        self.transferButton.snp.updateConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-12)
            make.height.equalTo(56)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
}

//MARK: PhoneNumberTextFieldViewDelegate

extension BalanceTransferView: PhoneNumberTextFieldViewDelegate {
    func textFieldDidTextChange(text: String) {
        self.updateSendButtonState()
    }
    func openContacts() {
        self.delegate?.openContacts()
    }
}

//MARK:  Transfer button

extension BalanceTransferView: LargeFilledButtonDelegate {
    func onButtonTap(sender: UIButton) {
        if sender.isEnabled {
            print("Button tapped!")
        }
    }
    
    func updateSendButtonState() {
        if let
            phoneNumber = self.phoneNumberTextFieldView.phoneTextField.text,
           !phoneNumber.isEmpty, phoneNumber.checkPhoneNumber() {
            transferButton.changeButtonState(isEnabled: true)
        }
        else {
            transferButton.changeButtonState(isEnabled: false)
        }
    }

    
    //MARK: Public

    public func startLoading() {
        self.loadingIndicator.startLoading()
    }
    public func stopLoading() {
        self.loadingIndicator.stopLoading {
            self.selectTransferAmountView.isHidden = false
        }
      
    }
}
