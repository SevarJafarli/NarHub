//
//  BalanceTransferInfoView.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 26.01.24.
//

import UIKit
import NarHubUIKit

class BalanceTransferInfoView: UIView, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    
    private let infoText: UILabel = {
        let lbl = UILabel()
        lbl.text = "“Balans köçürmə” xidmətindən istifadə etməklə sən öz balansından istənilən Nar abunəçisinin balansına 0.2, 0.5, 1 və ya 2 AZN məbləğində balans köçürə bilərsən."
        lbl.numberOfLines = 0
        lbl.textColor = .darkGray
        lbl.font = AppFonts.boldBodySize14.fontStyle
        return lbl
    }()
    
    fileprivate func addSubviews() {
        self.addSubview(self.infoText)
    }
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.disabledBtnColor)
        self.layer.cornerRadius = 16
    }
    
   private func addConstraints() {
       self.infoText.snp.updateConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.bottom.trailing.equalToSuperview().offset(-16)
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
}
