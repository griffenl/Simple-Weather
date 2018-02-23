//
//  WeatherCellViewModel.swift
//  Simple Weather
//
//  Created by Griffen Lawrence on 2/22/18.
//  Copyright © 2018 Griffen Lawrence. All rights reserved.
//

import Foundation
import UIKit

struct WeatherCellViewModel {
    let url: URL
    let day: String
    let description: String
    
    func loadImage(completion: @escaping (UIImage?) -> Void) {
        guard let imageData = try? Data(contentsOf: url) else {
            return
        }
        
        let image = UIImage(data: imageData)
        DispatchQueue.main.async {
            completion(image)
        }
    }
}
