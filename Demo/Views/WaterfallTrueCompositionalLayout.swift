//
//  WaterfallTrueCompositionalLayout.swift
//  Thel
//
//  Created by Vebjørn Daniloff on 31/10/2022.
//

import UIKit

public final class WaterfallTrueCompositionalLayout {
    public static func makeLayoutSection(
        config: Configuration,
        enviroment: NSCollectionLayoutEnvironment,
        sectionIndex: Int
    ) -> NSCollectionLayoutSection {
        
        // NSCollectionLayoutGroupCustomItem to create layout with custom frames
        var items = [NSCollectionLayoutGroupCustomItem]()
        
        
        let itemProvider = LayoutBuilder(
            configuration: config,
            collectionWidth: enviroment.container.contentSize.width
        )
        
        for i in 0..<config.itemCountProvider() {
            let item = itemProvider.makeLayoutItem(for: i)
            items.append(item)
        }
        
        let groupLayoutSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(itemProvider.maxColumnHeight())
        )
        print("maxColumnHeight \(itemProvider.maxColumnHeight())")
        
        let group = NSCollectionLayoutGroup.custom(layoutSize: groupLayoutSize) { _ in
            return items
        }
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsetsReference = config.contentInsetsReference
        return section
    }
}
