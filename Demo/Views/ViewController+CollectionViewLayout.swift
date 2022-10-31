//
//  ViewController+CollectionViewLayout.swift
//  Demo
//
//  Created by Vebjørn Daniloff on 31/10/2022.
//

import UIKit

// MARK: - Create Categories layout
extension ViewController {
    static func createHorizontalLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize:
                .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(0.5)
                )
        )
        item.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 5)
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .absolute(86 + 20),
                heightDimension: .estimated((57 * 2) + 10)
            ), subitem: item,
            count: 2
        )
        group.interItemSpacing = .fixed(10)
        let section = NSCollectionLayoutSection(group: group)
        
        
        section.contentInsets = .init(top: 20, leading: 20, bottom: 20, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
}


// MARK: - WaterFallLayout
extension ViewController {
    static func createWaterFallLayout(env: NSCollectionLayoutEnvironment, items: [WaterfallDataModel]) -> NSCollectionLayoutSection {
        
        let sectionHorizontalSpacing: CGFloat = 20
    
        let layout = WaterfallTrueCompositionalLayout.makeLayoutSection(
            config: .init(
                columnCount: 2,
                interItemSpacing: 10,
                sectionHorizontalSpacing: sectionHorizontalSpacing,
                itemCountProvider:  {
                    return items.count
                },
                itemHeightProvider: { index, itemWidth in
                    print(items[index].image.size.height)
                    return items[index].image.size.height
                }),
            enviroment: env, sectionIndex: 1
        )
        
        layout.boundarySupplementaryItems = [
            .init(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(27)),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
        ]
        layout.contentInsets = .init(
            top: 20,
            leading: sectionHorizontalSpacing,
            bottom: 20,
            trailing: sectionHorizontalSpacing
        )
        return layout
    }
}
