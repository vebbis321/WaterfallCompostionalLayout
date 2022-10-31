//
//  ViewController.swift
//  Demo
//
//  Created by Vebjørn Daniloff on 31/10/2022.
//

import UIKit

class ViewController: UIViewController {

    private var collectionView: UICollectionView!
    var dataSource: DataSource!
    
    private let viewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpViews()
        setUpConstraints()
        dataSource.setUpDataSource(horizontalData: viewModel.horizontalData, waterfallData: viewModel.waterfallData)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(collectionView.frame.size.height)
    }
}


// MARK: - SetUpViews
extension ViewController {
    private func setUpViews() {
    
        // CollectionView
        collectionView = .init(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        
        // Cell
        collectionView.register(HorizontalDataCell.self, forCellWithReuseIdentifier: HorizontalDataCell.reuseIdentifier)
        collectionView.register(WaterfallDataCell.self, forCellWithReuseIdentifier: WaterfallDataCell.reuseIdentifier)
        
        // Header
        collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.reuseIdentifier)
        
        view.addSubview(collectionView)
        dataSource = .init(collectionView, viewModel: viewModel)
    
    }
}

// MARK: - Layout
extension ViewController {
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionNumber, env in
            guard let self = self else { fatalError() }
            
            if sectionNumber == 0 {
                return ViewController.createHorizontalLayout()
            } else {
                return ViewController.createWaterFallLayout(env: env, items: self.viewModel.waterfallData)
            }
            
        }
        return layout
    }
}

// MARK: - Constraints
extension ViewController {
    private func setUpConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ViewController: UICollectionViewDelegate {
    
}
