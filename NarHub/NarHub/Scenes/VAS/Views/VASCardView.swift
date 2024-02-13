//
//  VASSwitchView.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 31.01.24.
//

import UIKit
import NarHubUIKit

class VASCardView: UIView, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    
    let vasModel: VASCardModel
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.boldTitleSize18.fontStyle
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var subtitleLabel: UILabel  = {
        let lbl = UILabel()
        lbl.font = AppFonts.regularBodySize14.fontStyle
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    lazy var vasSwitch: UISwitch = {
        let vasSwitch = UISwitch()
        vasSwitch.isOn = true
        vasSwitch.onTintColor = adaptiveColor(.mainColor)
        return vasSwitch
    }()
    
    lazy var serviceDateLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.boldTitleSize18.fontStyle
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var hiddenNumberUpdateProgressView: HiddenNumberUpdateProgressView = {
        let view = HiddenNumberUpdateProgressView()
        return view
    }()
    
    //MARK: Init
    
    init(vasModel: VASCardModel ) {
        self.vasModel = vasModel
        super.init(frame: .zero)
        self.configureView()
        self.setupView()
        self.addSubviews()
        self.addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
    }
    
    private func addSubviews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.subtitleLabel)
        
        if self.vasModel.hasServiceFee {
            self.addSubview(self.serviceDateLabel)
        }
        
        self.addSubview(self.vasSwitch)
        
        if self.vasModel.hasRenewalDate {
            self.addSubview(self.hiddenNumberUpdateProgressView)
        }
    }
    
    
    private func addConstraints() {
        if !self.vasModel.hasServiceFee {
            self.titleLabel.snp.updateConstraints { make in
                make.top.leading.equalToSuperview().offset(16)
                make.trailing.equalTo(self.vasSwitch.snp.leading).offset(-12)
            }
            self.subtitleLabel.snp.updateConstraints { make in
                make.top.equalTo(self.titleLabel.snp.bottom).offset(8)
                make.leading.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().offset(-16)
                make.trailing.equalTo(self.vasSwitch.snp.leading).offset(-32)
            }
            
            self.vasSwitch.snp.updateConstraints { make in
                make.top.equalToSuperview().offset(16)
                make.trailing.equalToSuperview().offset(-16)
            }
        }
        
        else {
            self.titleLabel.snp.updateConstraints { make in
                make.top.leading.equalToSuperview().offset(16)
                make.trailing.equalToSuperview().offset(-16)
                
            }
            self.subtitleLabel.snp.updateConstraints { make in
                make.top.equalTo(self.titleLabel.snp.bottom).offset(8)
                make.leading.equalToSuperview().inset(16)
                make.trailing.equalToSuperview().offset(-16)
            }
            if  !self.vasModel.hasRenewalDate {
                self.serviceDateLabel.snp.updateConstraints { make in
                    make.top.equalTo(self.subtitleLabel.snp.bottom).offset(16)
                    make.leading.equalToSuperview().offset(16)
                    make.bottom.equalToSuperview().offset(-16)
                }
                
                self.vasSwitch.snp.updateConstraints { make in
                    make.top.equalTo(self.subtitleLabel.snp.bottom).offset(16)
                    make.leading.equalTo(self.serviceDateLabel.snp.trailing).offset(16)
                    make.trailing.equalToSuperview().offset(-16)
                    make.bottom.equalToSuperview().offset(-16)
                }
            }
        
          else {
                self.serviceDateLabel.snp.updateConstraints { make in
                    make.top.equalTo(self.subtitleLabel.snp.bottom).offset(16)
                    make.leading.equalToSuperview().offset(16)
                    make.bottom.equalTo(self.hiddenNumberUpdateProgressView.snp.top).offset(-16)
                }
                self.vasSwitch.snp.updateConstraints { make in
                    make.top.equalTo(self.subtitleLabel.snp.bottom).offset(16)
                    make.leading.equalTo(self.serviceDateLabel.snp.trailing).offset(16)
                    make.trailing.equalToSuperview().offset(-16)
                    make.bottom.equalTo(self.hiddenNumberUpdateProgressView.snp.top ).offset(-16)
                }
                self.hiddenNumberUpdateProgressView.snp.updateConstraints { make in
                    make.leading.trailing.equalToSuperview().inset(16)
                    make.bottom.equalToSuperview().offset(-16)
                }
            }
        }
    }
    
    private func configureView() {
        self.titleLabel.text = vasModel.title
        self.subtitleLabel.text = vasModel.desc
        
        if self.vasModel.hasServiceFee {
            self.serviceDateLabel.text = "\(vasModel.amountMonthly) / \(vasModel.amount) ₼"
        }
        
        if self.vasModel.hasRenewalDate {
            self.hiddenNumberUpdateProgressView.configure(renewal: self.vasModel.renewal, renewalDate: self.vasModel.renewalDate, nextRenewalDate: self.vasModel.nextRenewalDate, progress: self.vasModel.progressValue)
        }
    }
    
}
