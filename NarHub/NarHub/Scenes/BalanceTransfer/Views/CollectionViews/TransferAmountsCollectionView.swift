//
//  TransferAmountsCollectionView.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 06.02.24.
//

import UIKit

class TransferAmountsCollectionView: UICollectionView {
    //MARK: Init
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 8
        layout.itemSize = CGSize(width: 83, height: 56)
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = .clear
    }
    required init?(coder: NSCoder) {
        fatalError()
    }

}
