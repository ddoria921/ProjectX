//
//  Crop.swift
//  ProjectX
//
//  Created by Tulio Troncoso on 2/15/20.
//  Copyright © 2020 Darin Doria. All rights reserved.
//

import Foundation

/// A thing that can be planted and harvested
protocol Crop {
    /// Name of the plant
    var name: String { get }

    /// Amount of space this crop needs to grow
    var footprint: Dimensions { get }

    /// Time it takes from plant to harvest, in seconds
    var timeToHarvest: TimeInterval { get }
}
