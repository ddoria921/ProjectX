//
//  Kartky.swift
//  ProjectX
//
//  Created by Tulio Troncoso on 2/15/20.
//  Copyright © 2020 Darin Doria. All rights reserved.
//

import Foundation

class KratkyMethod: Farm {
    var name: String = "Kratky Method" 
    var infrastructureSize = Dimensions(width: 20.0, length: 20.0, height: 40.0)
    var dimensions: Dimensions
    var crop: Crop
    var score: Int = 2

    /// Initializes a farm with dimensions and crop
    /// - Parameters:
    ///   - dimensions: dimensions of the farm
    ///   - crop: the kind of crop that will grow in the farm
    init(dimensions: Dimensions, crop: Crop) {
        self.dimensions = dimensions
        self.crop = crop
    }

    func buildTime() -> TimeInterval {
        return TimeInterval.from(minutes: 30)
    }

    func buildCost() -> Double {
        return 5.0
    }

    func maintenanceTime() -> TimeInterval {
        return TimeInterval.from(minutes: 30)
    }

    func operationalCost() -> Double {
        return 0.5
    }

}
