//
//  HiddenNumberUpdateProgressView.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 01.02.24.
//

import UIKit
import NarHubUIKit

class HiddenNumberUpdateProgressView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    
    private lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = AppFonts.boldTitleSize18.fontStyle
        return lbl
    }()
    
    private lazy var numberOfDays: UILabel = {
        let lbl = UILabel()
        lbl.textColor = adaptiveColor(.darkGrayLabelColor)
        lbl.font = AppFonts.boldBodySize14.fontStyle
        lbl.textAlignment = .right
        return lbl
    }()
    
    private lazy var nextUpdateDateLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.black
        lbl.font = AppFonts.regularBodySize14.fontStyle
        return lbl
    }()
    
    private lazy var trackerView: VASTrackerView = {
        let view = VASTrackerView()
        return view
    }()
    
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.addConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.addSubview(self.title)
        self.addSubview(self.numberOfDays)
        self.addSubview(self.trackerView)
        self.addSubview(self.nextUpdateDateLabel)
    }
    
    private func addConstraints() {
        
        self.title.snp.updateConstraints { make in
            make.top.leading.equalToSuperview()
            make.bottom.equalTo(self.trackerView.snp.top).offset(-16)
        }
        self.numberOfDays.snp.updateConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(self.title.snp.trailing).offset(16)
            make.bottom.equalTo(self.trackerView.snp.top).offset(-16)
        }
        self.trackerView.snp.updateConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.nextUpdateDateLabel.snp.top).offset(-16)
        }
        self.nextUpdateDateLabel.snp.updateConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    //MARK: Public
    
    public func configure(renewal:String, renewalDate: String, nextRenewalDate: String, progress: Double) {
      
//        let numberOfDaysLeftToReneweal = DateCalculator.shared.calculateDaysBetweenTwoDates(start: Date.now, end: nextUpdateDate)
//        print ("numberOfDaysLeftToReneweal \(numberOfDaysLeftToReneweal)")
//        print("Next update date \(nextUpdateDate)")
//        
        self.title.text = renewal
        self.numberOfDays.text = renewalDate
        self.nextUpdateDateLabel.text = nextRenewalDate
        
//        let progress: Float = 1.0 - Float(numberOfDaysLeftToReneweal) / Float(30)
       
        print("progress \(progress)")
        self.trackerView.setProgress(Float(progress), animated: true)
    }
}
