//
//  DataSource.swift
//  Demo
//
//  Created by Vebjørn Daniloff on 31/10/2022.
//

import UIKit

enum Sections {
    case horizontalSection
    case waterfallSection
}

enum SectionItems: Hashable {
    case horizontalItems(HorizontalDataModel)
    case waterfallItems(WaterfallDataModel)
}

struct SeciontData {
    var key: Sections
    var values: [SectionItems]
}


final class DataSource: UICollectionViewDiffableDataSource<Sections, SectionItems> {
    var viewModel: ViewModel
    init(_ collectionView: UICollectionView, viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(collectionView: collectionView) { collectionView, indexPath, item in
         
            switch item {
            case .horizontalItems(let model):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalDataCell.reuseIdentifier, for: indexPath) as? HorizontalDataCell else {
                    fatalError()
                }
                cell.setUp(with: model)
                return cell
            case .waterfallItems(let model):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WaterfallDataCell.reuseIdentifier, for: indexPath) as? WaterfallDataCell else {
                    fatalError()
                }
                cell.configure(with: model)
                return cell
            }
        }
        
        supplementaryViewProvider = { collectionView, kind, indexPath in
            if indexPath.section == 1 {
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.reuseIdentifier, for: indexPath) as? HeaderCell else {
                    fatalError()
                }
                header.setUp(text: "Header")
                return header
            } else {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Standard", for: indexPath)
                header.isHidden = true
                return header
            }
        }
    }
    
    func setUpDataSource(horizontalData: [HorizontalDataModel], waterfallData: [WaterfallDataModel]) {
        var snapshot = snapshot()

        snapshot.deleteAllItems()
        snapshot.appendSections([.horizontalSection, .waterfallSection])
        
        snapshot.appendItems(horizontalData.map { .horizontalItems($0) }, toSection: .horizontalSection)
        snapshot.appendItems(waterfallData.map { .waterfallItems($0) }, toSection: .waterfallSection)
        apply(snapshot, animatingDifferences: false)
    }
    
    func updateDataSource(with data: SeciontData, animated: Bool = true) {
       // update dataSource

    }
}

