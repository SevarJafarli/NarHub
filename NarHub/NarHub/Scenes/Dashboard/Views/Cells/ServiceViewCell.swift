//
//  ServiceCollectionViewCell.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 23.01.24.
//

import UIKit
import NarHubUIKit


class ServiceViewCell: UICollectionViewCell, ThemeableView {
    
    static var reuseIdentifier: String = "ServiceViewCell"

    var theme: ThemeProvider = App.theme
    
    
    private lazy var serviceLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.boldBodySize14.fontStyle
        lbl.numberOfLines = 0
        lbl.textColor = .black
        return lbl
    }()
    
    private lazy var circleView: UIView = {
        let circleView = UIView()
        circleView.layer.cornerRadius = 20
        circleView.backgroundColor = adaptiveColor(.borderColor)
        return circleView
    }()
    
    let serviceImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.clipsToBounds = true
        return imgView
    }()
    

    fileprivate func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
    }
    
    private func addSubviews() {
        self.circleView.addSubview(self.serviceImageView)
        self.contentView.addSubview(self.circleView)
        self.contentView.addSubview(self.serviceLabel)
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
    
   private func addConstraints() {
       self.serviceImageView.snp.updateConstraints { make in
            make.width.height.equalTo(24)
            make.center.equalTo(circleView)
        }
       self.circleView.snp.updateConstraints { make in
            make.width.height.equalTo(40)
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).offset(12)
        }
        
       self.serviceLabel.snp.updateConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(circleView.snp.trailing).offset(8)
            make.trailing.bottom.equalTo(contentView).offset(-12)
            
        }
    }
    
    //MARK: Public
    
    public func configure(with hubModel: HubModel) {
        self.serviceLabel.text = hubModel.title
        self.serviceImageView.image =  hubModel.image
    }
}
