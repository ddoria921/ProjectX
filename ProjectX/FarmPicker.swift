//
//  FarmPicker.swift
//  ProjectX
//
//  Created by Tulio Troncoso on 2/15/20.
//  Copyright © 2020 Darin Doria. All rights reserved.
//

import Foundation

class FarmPicker {

    /// Gets farms that fit the given dimensions
    /// - Parameter dimensions: the available space for the farms
    func getFarms(dimensions: Dimensions, crop: Crop) -> [Farm] {
        return [
            NFTSystem(dimensions: dimensions, crop: crop)
        ]
    }

    /// Gets farms that fit the given dimensions. Assumes you are planting Butterhead Lettuce
    /// - Parameter dimensions: the available space for the farms
    func getFarms(dimensions: Dimensions) -> [Farm] {
        return getFarms(dimensions: dimensions, crop: ButterheadLettuce())
    }
}
