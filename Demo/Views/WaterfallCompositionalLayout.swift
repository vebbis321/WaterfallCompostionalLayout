//
//  WaterfallCompositionalLayout.swift
//  Thel
//
//  Created by Vebjørn Daniloff on 31/10/2022.
//

import UIKit

public extension WaterfallTrueCompositionalLayout {
    typealias ItemHeightProvider = (_ index: Int, _ itemWidth: CGFloat) -> CGFloat
    typealias ItemCountProvider = () -> Int
    
    struct Configuration {
        public let columnCount: Int
        public let interItemSpacing: CGFloat
        public let sectionHorizontalSpacing: CGFloat
        public let contentInsetsReference: UIContentInsetsReference
        public let itemHeightProvider: ItemHeightProvider
        public let itemCountProvider: ItemCountProvider
            
        public init(
            columnCount: Int = 2,
            interItemSpacing: CGFloat = 8,
            sectionHorizontalSpacing: CGFloat = 0,
            contentInsetsReference: UIContentInsetsReference = .automatic,
            itemCountProvider: @escaping ItemCountProvider,
            itemHeightProvider: @escaping ItemHeightProvider
        ) {
            self.columnCount = columnCount
            self.interItemSpacing = interItemSpacing
            self.sectionHorizontalSpacing = sectionHorizontalSpacing * 2
            self.contentInsetsReference = contentInsetsReference
            self.itemCountProvider = itemCountProvider
            self.itemHeightProvider = itemHeightProvider
        }
    }
}
