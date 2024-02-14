//
//  ProductViewCell.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 24.01.24.
//

import UIKit
import NarHubUIKit

class ProductViewCell: UIView {
    let productType: ProductType
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    
    private lazy var productLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.boldBodySize14.fontStyle
        lbl.textColor = .black
        return lbl
    }()
    
    private lazy var productImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.clipsToBounds = true
        return imgView
    }()
    
    fileprivate func addSubviews() {
        self.addSubview(self.cardView)
        self.cardView.addSubview(self.productLabel)
        self.cardView.addSubview(self.productImageView)
    }
    
    private func addConstraints() {
        self.cardView.snp.updateConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        self.productLabel.snp.updateConstraints { make in
            make.leading.top.equalTo(cardView).offset(12)
        }
        self.productImageView.snp.updateConstraints { make in
            make.top.trailing.bottom.equalTo(cardView)
            make.height.equalTo(cardView.snp.height)
        }
    }
    
    //MARK: Init
    
    init(productType: ProductType) {
        self.productType = productType
        super.init(frame: .zero)
        self.configure(with: productType)
        self.addSubviews()
        self.addConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    //MARK: Public configure
    
    public func configure(with productType: ProductType) {
        self.productLabel.text = productType.getTitle()
        self.productImageView.image = productType.getImage()
    }
}
