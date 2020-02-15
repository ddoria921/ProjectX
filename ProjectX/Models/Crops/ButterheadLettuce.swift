//
//  ButterheadLettuce.swift
//  ProjectX
//
//  Created by Tulio Troncoso on 2/15/20.
//  Copyright © 2020 Darin Doria. All rights reserved.
//

import Foundation

class ButterheadLettuce : Crop {
    var name: String = "Butterhead Lettuce"
    var timeToHarvest = TimeInterval.from(days: 14)
    var footprint: Dimensions = Dimensions(width: 6.0, length: 6.0, height: 3.0)
}
