//
//  HorizontalDataCell.swift
//  Demo
//
//  Created by Vebjørn Daniloff on 31/10/2022.
//

import UIKit

final class HorizontalDataCell: UICollectionViewCell {
    
    static let reuseIdentifier = "HorizontalDataCell"
    
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Config
extension HorizontalDataCell {
    func setUp(with model: HorizontalDataModel) {
        contentView.backgroundColor = model.color
    }
}
