//
//  HorizontalDataModel.swift
//  Demo
//
//  Created by Vebjørn Daniloff on 31/10/2022.
//

import UIKit

struct HorizontalDataModel: Hashable, Equatable {
    let id = UUID()
    let color: UIColor
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: HorizontalDataModel, rhs: HorizontalDataModel) -> Bool {
        return lhs.id == rhs.id
    }
}
