//
//  SelectTransferAmountView.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 26.01.24.
//

import UIKit
import NarHubUIKit


class SelectTransferAmountView: UIView {
  
    private let title: UILabel = {
        let lbl = UILabel()
        lbl.text = "Köçürüləcək məbləğ"
        lbl.textColor = .black
        lbl.font = AppFonts.boldBodySize16.fontStyle
        return lbl
    }()

    lazy var transferAmountsCollectionView: TransferAmountsCollectionView = {
        let collectionView = TransferAmountsCollectionView()
        collectionView.register(TransferAmountCell.self, forCellWithReuseIdentifier: TransferAmountCell.reuseIdentifier)
        
        return collectionView
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
        self.addSubview(self.transferAmountsCollectionView)
    }
    
    private func addConstraints() {
        self.title.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        self.transferAmountsCollectionView.snp.updateConstraints { make in
            make.top.equalTo(self.title.snp.bottom).offset(16)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(56)
        }
    }
}
