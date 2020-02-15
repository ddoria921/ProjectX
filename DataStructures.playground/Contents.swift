import Foundation

extension TimeInterval {
    static func from(days: Int) -> TimeInterval {
        return Double(86_400 * days)
    }
    
    static func from(hours: Int) -> TimeInterval {
        return Double(60 * 60 * hours)
    }
}

struct Dimensions {
    // Width in inches
    var width: Double
    
    // Length in inches
    var length: Double
    
    // Height in inches
    var height: Double
    
    static func / (lhs: Dimensions, rhs: Dimensions) -> Double {
        // over simplified calculation
        return (lhs.length * lhs.width * lhs.height) / (rhs.length * rhs.width * rhs.height)
    }
}

protocol Crop {
    var name: String { get }
    
    /// Amount of space this crop needs to grow
    var footprint: Dimensions { get }
    
    var timeToHarvest: TimeInterval { get }
}

struct ButterheadLettuce : Crop {
    var name: String = "Butterhead Lettuce"
    var timeToHarvest: TimeInterval
    var footprint: Dimensions = Dimensions(width: 6.0, length: 6.0, height: 3.0)
}

protocol Farm {
    
    var dimensions: Dimensions { get }
    
    /// Time to build in hours
    func buildTime() -> TimeInterval
    
    /// Up-front cost to build the cost
    func buildCost() -> Double
    
    /// Calculates costs per week
    func maintenanceTime() -> TimeInterval
    
    /// Calculates costs per week
    func operationalCost() -> Double

    /// Calculates costs per week
    func cropOutput(crop: Crop) -> Double
    
    func usableSpace() -> Dimensions
}

extension Farm {
    func cropOutput(crop: Crop) -> Double {
        // multiple of (crop dimensions / usable space) * crop.timeToHarvest (per 1 crop)
        return floor(crop.footprint / usableSpace()) * crop.timeToHarvest
    }
}

class NFTSystem: Farm {
    
    var dimensions: Dimensions
    
    init(dimensions: Dimensions) {
        self.dimensions = dimensions
    }
    
    func buildTime() -> TimeInterval {
        return TimeInterval.from(hours: 4)
    }
    
    func buildCost() -> Double {
        return 0.0
    }
    
    func maintenanceTime() -> TimeInterval {
        return 2
    }
    
    func operationalCost() -> Double {
        return 0.0
    }
    
    func usableSpace() -> Dimensions {
        return Dimensions(width: 0.0, length: 0.0, height: 0.0)
    }
}

let dimens = Dimensions(width: 1.0, length: 1.0, height: 1.0)
NFTSystem(dimensions: dimens)



