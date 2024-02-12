//
//  ProductCollectionView.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 24.01.24.
//

import UIKit
import NarHubUIKit


class ProductsView: UIView {
    
    private var productViewCells: [ProductViewCell] = []
    
    private lazy var productTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Products"
        lbl.font = AppFonts.boldTitleSize20.fontStyle
        return lbl
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    fileprivate func addSubviews() {
        ProductType.allCases.forEach { productType in
            self.productViewCells.append(ProductViewCell(productType: productType))
        }
        self.addSubview(productTitle)
        self.setupProductCards()
    }
    
    fileprivate func addConstraints() {
        self.productTitle.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        self.contentStackView.snp.updateConstraints { make in
            make.top.equalTo(productTitle.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(80)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupProductCards() {
        self.productViewCells.forEach { productViewCell in
            self.contentStackView.addArrangedSubview(productViewCell)
        }
        self.addSubview(self.contentStackView)
    }
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

