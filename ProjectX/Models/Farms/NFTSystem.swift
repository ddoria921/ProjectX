//
//  NFTSystem.swift
//  ProjectX
//
//  Created by Tulio Troncoso on 2/15/20.
//  Copyright © 2020 Darin Doria. All rights reserved.
//

import Foundation

/**
 Nutrient Film Technique
 */
class NFTSystem: Farm {
    var name = "NFT System"
    var crop: Crop
    var dimensions: Dimensions
    var infrastructureSize = Dimensions(width: 12, length: 16, height: 72)
    var score: Int = 3

    // Costs
    let waterCost = 0.05 // Water price is negligible
    let electricityCost = 1.5 // This is a gross overestimation to be on the safe side
    let nutrientCost = 0.07 // This is calculated based on 33 plant sites per month
    let seedCost = 1.0

    /// Initializes a farm with dimensions and crop
    /// - Parameters:
    ///   - dimensions: dimensions of the farm
    ///   - crop: the kind of crop that will grow in the farm
    init(dimensions: Dimensions, crop: Crop) {
        self.dimensions = dimensions
        self.crop = crop
    }

    func buildTime() -> TimeInterval {
        return TimeInterval.from(hours: 4)
    }

    func buildCost() -> Double {
        // Tulio built an NFT farm for $400 for 33 sites of butterhead lettuce
        let siteCost: Double = 400 / 33
        return Double(cropSites()) * siteCost
    }

    func maintenanceTime() -> TimeInterval {
        // Need one hour a week to make sure the system is not destroying your house
        return 1.0
    }

    func operationalCost() -> Double {
        // Need water, electricity, nutrients, and seeds
        return waterCost + electricityCost + nutrientCost + seedCost
    }
    
}
