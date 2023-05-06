//
//  LatestCollectionViewCell.swift
//  TestApp
//
//  Created by Дмитрий Лоренц on 05.05.2023.
//

import UIKit

class LatestCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "LatestCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        layer.cornerRadius = 10
        clipsToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
