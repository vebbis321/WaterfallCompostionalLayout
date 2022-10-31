//
//  ViewModel.swift
//  Demo
//
//  Created by Vebjørn Daniloff on 31/10/2022.
//

import UIKit

final class ViewModel {
    
    var horizontalData = [HorizontalDataModel]()
    var waterfallData = [WaterfallDataModel]()
    
    init() {
        for index in 0..<10 {
            let color = UIColor(hue:CGFloat.random(in: 0.1..<0.9), saturation: 1.0, brightness: 1.0, alpha: 1.0)
            let horizontalItem: HorizontalDataModel = .init(color: color)
            let waterfallItem: WaterfallDataModel = .init(image: UIImage(named: "image\(index)")!, index: index)
            horizontalData.append(horizontalItem)
            waterfallData.append(waterfallItem)
        }
    }
}
