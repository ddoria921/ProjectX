//
//  TimeIntervalExtensions.swift
//  ProjectX
//
//  Created by Tulio Troncoso on 2/15/20.
//  Copyright © 2020 Darin Doria. All rights reserved.
//

import Foundation

extension TimeInterval {
    static func from(days: Int) -> TimeInterval {
        return Double(86_400 * days)
    }

    static func from(hours: Int) -> TimeInterval {
        return Double(60 * 60 * hours)
    }

    static func from(minutes: Int) -> TimeInterval {
        return Double(60 * minutes)
    }
}
