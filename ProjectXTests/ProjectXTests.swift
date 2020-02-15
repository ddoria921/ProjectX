//
//  ProjectXTests.swift
//  ProjectXTests
//
//  Created by Tulio Troncoso on 2/15/20.
//  Copyright © 2020 Darin Doria. All rights reserved.
//

import XCTest
import ProjectX

class ProjectXTests: XCTestCase {

    func testNFTSystem() {
        let dimensions = Dimensions(width: 24, length: 38, height: 84)
        let farm = NFTSystem(dimensions: dimensions, crop: ButterheadLettuce())
        let kratky = KratkyMethod(dimensions: dimensions, crop: ButterheadLettuce())

        XCTAssertEqual(farm.cropSites(), 29)
    }

}
