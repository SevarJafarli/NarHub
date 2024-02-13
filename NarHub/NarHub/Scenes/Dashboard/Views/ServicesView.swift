//
//  ServiceCollectionView.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 24.01.24.
//


import UIKit
import NarHubUIKit

class ServicesView: UIView {
    
    lazy var headerTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Services"
        lbl.font = AppFonts.boldTitleSize20.fontStyle
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var servicesCollectionView: ServicesCollectionView = {
        let collectionView = ServicesCollectionView()
        collectionView.register(ServiceViewCell.self, forCellWithReuseIdentifier: ServiceViewCell.reuseIdentifier)
        return collectionView
    }()
    
    fileprivate func addSubviews() {
        self.addSubview(self.headerTitle)
        self.addSubview(self.servicesCollectionView)
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
    
    private func addConstraints() {
        self.headerTitle.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        self.servicesCollectionView.snp.updateConstraints({ make in
            make.top.equalTo(headerTitle.snp.bottom).offset(16)
            make.height.equalTo(calculateServiceCollectionViewHeight() + 16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
        })
    }
    
    private func calculateServiceCollectionViewHeight() -> Int {
//        let itemHeight = 66
//        let sectionInset = 8
//        let totalHeight = columnCount * itemHeight + insetCount * sectionInset
        
        let totalHeight = UIScreen.main.bounds.height * 0.8 - 310 - 23 // according to design
        return Int(totalHeight)
    }
    
//    private var columnCount: Int {
//        if  5 % 2 == 0 {
//            return 5 / 2
//        }
//        else {
//            return 5 / 2 + 1
//        }
//    }
}







