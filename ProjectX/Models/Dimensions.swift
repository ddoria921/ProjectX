//
//  Dimensions.swift
//  ProjectX
//
//  Created by Tulio Troncoso on 2/15/20.
//  Copyright © 2020 Darin Doria. All rights reserved.
//

import Foundation

/// Dimensions in inches
struct Dimensions {
    // Width in inches
    var width: Double

    // Length in inches
    var length: Double

    // Height in inches
    var height: Double

    /// Initializes Dimensions with width, length and height in inches
    /// - Parameters:
    ///   - width: width in inches
    ///   - length: length in inches
    ///   - height: height in inches
    init(width: Double, length: Double, height: Double) {
        self.width = width
        self.length = length
        self.height = height
    }

    static func / (lhs: Dimensions, rhs: Dimensions) -> Double {
        // over simplified calculation
        return (lhs.length * lhs.width * lhs.height) / (rhs.length * rhs.width * rhs.height)
    }

    static func - (lhs: Dimensions, rhs: Dimensions) -> Dimensions {
        return Dimensions(width: lhs.width - rhs.width,
                          length: lhs.length - rhs.length,
                          height: lhs.height - rhs.height)
    }
}
