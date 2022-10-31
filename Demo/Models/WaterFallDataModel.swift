//
//  WaterFallDataModel.swift
//  Demo
//
//  Created by Vebjørn Daniloff on 31/10/2022.
//

import UIKit

struct WaterfallDataModel: Hashable {
    private let identifier = UUID()
    let image: UIImage
    let index: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func == (lhs: WaterfallDataModel, rhs: WaterfallDataModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
