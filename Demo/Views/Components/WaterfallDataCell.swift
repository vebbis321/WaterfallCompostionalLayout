//
//  WaterfallDataCell.swift
//  Demo
//
//  Created by Vebjørn Daniloff on 31/10/2022.
//

import UIKit

class WaterfallDataCell: UICollectionViewCell {
    static let reuseIdentifier = "WaterfallDataCell"
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    private let indexLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
   
    func setUpLayout() {
        contentView.addSubview(imageView)
        imageView.addSubview(indexLabel)
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        indexLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        indexLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        indexLabel.text = nil
    }
    
    func configure(with model: WaterfallDataModel) {
        DispatchQueue.main.async {
            self.indexLabel.text = "\(model.index)"
            self.imageView.image = model.image
        }
    }
}





