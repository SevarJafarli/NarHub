//
//  Cell+Configurer.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 24.01.24.
//

import Foundation

import UIKit

public protocol CellConfigurer: AnyObject {
    static var reuseIdentifier: String {get}
}

public extension CellConfigurer {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: CellConfigurer { }
