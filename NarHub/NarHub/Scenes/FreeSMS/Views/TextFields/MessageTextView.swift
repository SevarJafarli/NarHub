//
//  MessageTextView.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 30.01.24.
//

import Foundation
import UIKit
import NarHubUIKit

protocol MessageTextViewDelegate: AnyObject {
    func textViewDidChange(text: String)
}
class MessageTextView: UIView {
    
    weak var viewDelegate: MessageTextViewDelegate?
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor(named: ColorStyle.darkGrayLabelColor.rawValue)
        textView.font = AppFonts.boldBodySize16.fontStyle
        textView.delegate = self
        textView.tintColor = UIColor(named: ColorStyle.mainColor.rawValue)
        textView.backgroundColor = .clear
        return textView
    }()
    lazy var placeholderText: UILabel = {
        let lbl = UILabel()
        lbl.text = "Mesaj daxil edin..."
        lbl.textColor = UIColor(named: ColorStyle.darkGrayLabelColor.rawValue)
        return lbl
    }()
    lazy var smsCountTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "SMS sayı: 1/2"
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var smsCount: UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.textColor = .black
        return lbl
    }()
    
    
    //MARK:  Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        
        
        self.addSubviews()
        self.addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.addSubview(self.textView)
        self.addSubview(self.placeholderText)
        self.addSubview(self.smsCountTitleLabel)
        self.addSubview(self.smsCount)
    }
    
    private func addConstraints() {
        self.textView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        self.placeholderText.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            
        }
        
        self.smsCountTitleLabel.snp.updateConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        self.smsCount.snp.updateConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(8)
            make.leading.equalTo(self.smsCountTitleLabel.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
}


extension MessageTextView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderText.isHidden = true
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeholderText.isHidden = false
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        viewDelegate?.textViewDidChange(text: textView.text)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        return numberOfChars < 100    // 10 Limit Value
    }
}

