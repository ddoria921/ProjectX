//
//  Farm.swift
//  ProjectX
//
//  Created by Tulio Troncoso on 2/15/20.
//  Copyright © 2020 Darin Doria. All rights reserved.
//

import Foundation

protocol Farm {
    /// Dimensions of the farm
    var dimensions: Dimensions { get }

    /// Crop that this farm will grow
    var crop: Crop { get }

    /// Time to build in hours
    func buildTime() -> TimeInterval

    /// Up-front cost to build the cost
    func buildCost() -> Double

    /// How long one would have to work on this farm per week
    func maintenanceTime() -> TimeInterval

    /// How much it would cost to keep this farm running per week
    func operationalCost() -> Double

    /// How many crops would be harvested per week
    func cropOutput(crop: Crop) -> Double

    /// Amount of usable space in the farm
    func usableSpace() -> Dimensions

    /// Number of sites that this farm can support
    func cropSites() -> Int
}

extension Farm {
    func cropOutput(crop: Crop) -> Double {
        // multiple of (crop dimensions / usable space) * crop.timeToHarvest (per 1 crop)
        return floor(crop.footprint / usableSpace()) * crop.timeToHarvest
    }

    func cropSites() -> Int {
        return Int(floor(usableSpace() / crop.footprint))
    }
}
