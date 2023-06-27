//
//  LatestCollectionViewCell.swift
//  TestApp
//
//  Created by Дмитрий Лоренц on 05.05.2023.
//

import UIKit
import SnapKit

final class LatestCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "LatestCollectionViewCell"
    var imageViewCell: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setOutlets()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setOutlets() {
        backgroundColor = .red
        layer.cornerRadius = 10
        clipsToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        contentView.addSubview(imageViewCell)
    }
    
    private func setConstraints() {
        imageViewCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
