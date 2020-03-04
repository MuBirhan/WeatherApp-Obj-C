//
//  WeatherEntity+CoreDataProperties.swift
//  
//
//  Created by Muradasil Birhan on 02/03/2020.
//
//

import Foundation
import CoreData


extension WeatherEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherEntity> {
        return NSFetchRequest<WeatherEntity>(entityName: "WeatherEntity")
    }

    @NSManaged public var city: String?
    @NSManaged public var imgUrl: String?
    @NSManaged public var lat: Double
    @NSManaged public var lon: Double
    @NSManaged public var mainEvent: String?
    @NSManaged public var name: String?
    @NSManaged public var rain: Double
    @NSManaged public var region: String?
    @NSManaged public var temperature: Double
    @NSManaged public var time: Int32
    @NSManaged public var wind: Double

}
