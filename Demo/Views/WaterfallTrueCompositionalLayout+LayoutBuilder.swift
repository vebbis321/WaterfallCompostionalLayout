//
//  WaterfallTrueCompositionalLayout+LayoutBuilder.swift
//  Thel
//
//  Created by Vebjørn Daniloff on 31/10/2022.
//

import UIKit

extension WaterfallTrueCompositionalLayout {
    final class LayoutBuilder {
        private var columnHeights: [CGFloat]
        private let columnCount: CGFloat
        private let itemHeightProvider: ItemHeightProvider
        private let interItemSpacing: CGFloat
        private let sectionHorizontalSpacing: CGFloat
        private let collectionWidth: CGFloat
        
        init(
            configuration: Configuration,
            collectionWidth: CGFloat
        ) {
            self.columnHeights = [CGFloat](repeating: 0, count: configuration.columnCount)
            self.columnCount = CGFloat(configuration.columnCount)
            self.itemHeightProvider = configuration.itemHeightProvider
            self.interItemSpacing = configuration.interItemSpacing
            self.sectionHorizontalSpacing = configuration.sectionHorizontalSpacing
            self.collectionWidth = collectionWidth
        }
        
        func makeLayoutItem(for row: Int) -> NSCollectionLayoutGroupCustomItem {
            let frame = frame(for: row)
            columnHeights[columnIndex()] = frame.maxY + interItemSpacing
            print("frame: \(frame)")
            return NSCollectionLayoutGroupCustomItem(frame: frame)
        }
        
        func maxColumnHeight() -> CGFloat {
            print("columnHeights\(columnHeights)")
            return columnHeights.max() ?? 0
        }
    }
}

private extension WaterfallTrueCompositionalLayout.LayoutBuilder {
    private var columnWidth: CGFloat {
        let spacing = (columnCount - 1) * interItemSpacing
        return (collectionWidth - spacing - sectionHorizontalSpacing) / columnCount
    }
    
    func frame(for row: Int) -> CGRect {
        let width = columnWidth
        let height = itemHeightProvider(row, width)
        let size = CGSize(width: width, height: height)
        let origin = itemOrigin(width: size.width)
        return CGRect(origin: origin, size: size)
    }
    
    private func itemOrigin(width: CGFloat) -> CGPoint {
        let y = columnHeights[columnIndex()].rounded()
        let x = (width + interItemSpacing) * CGFloat(columnIndex())
        return CGPoint(x: x, y: y)
    }
    
    private func columnIndex() -> Int {
        columnHeights
            .enumerated()
            .min(by: { $0.element < $1.element })?
            .offset ?? 0
    }
}
