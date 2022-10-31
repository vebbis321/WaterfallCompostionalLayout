//
//  HeaderCell.swift
//  Demo
//
//  Created by Vebjørn Daniloff on 31/10/2022.
//

import UIKit

final class HeaderCell: UICollectionReusableView {
    
    static let reuseIdentifier = "HeaderCell"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(label)
        constrainLabel()
    }
    
    private func constrainLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    
    func setUp(text: String) {
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
