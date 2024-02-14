//
//  DailySMSLimitView.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 25.01.24.
//

import UIKit
import NarHubUIKit

class DailySMSLimitView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.boldTitleSize18.fontStyle
        lbl.textColor = .black
        return lbl
    }()
    
    private lazy var smsType: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.boldBodySize12.fontStyle
        lbl.textColor = adaptiveColor(.labelColor)
        return lbl
    }()
    
    private lazy var smsCount: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.boldTitleSize18.fontStyle
        lbl.textColor = .black
        return lbl
    }()
    
    fileprivate func setupUI() {
        backgroundColor = .white
        self.layer.cornerRadius = 16
    }
    
    fileprivate func addSubviews() {
        addSubview(titleLabel)
        addSubview(smsType)
        addSubview(smsCount)
    }
    
   private func addConstraints() {
        titleLabel.snp.updateConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
        }
        smsType.snp.updateConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        smsCount.snp.updateConstraints { make in
            make.top.equalTo(smsType.snp.bottom)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
        self.addSubviews()
        self.addConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: Public configure
    
    public func configure(with dailyInfoModel: DailySMSInfoModel) {
        self.titleLabel.text = dailyInfoModel.title
        self.smsType.text = dailyInfoModel.desc
        self.smsCount.text = dailyInfoModel.smsCount
    }
}
