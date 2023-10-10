//
//  Vehicle.swift
//  Cars
//
//  Created by William Mooney on 10/9/23.
//

import Foundation

class Vehicle: Codable, Identifiable {
    var id: UUID;
    var model: String
    var make: String
    var year: String
    var odometer: String?
    var longitude: Float?
    var latitude: Float?

    init() {
        self.id = UUID()
        self.model = ""
        self.make = ""
        self.year = ""
        self.odometer = ""
        self.longitude = nil
        self.latitude = nil
    }

    init(uuid: UUID, model: String, make: String, year: String, latitude: Float?, longitude: Float?) {
        self.id = uuid
        self.model = model
        self.make = make
        self.year = year
        self.odometer = ""
        self.longitude = longitude ?? nil
        self.latitude = latitude ?? nil
    }

    enum ConfigKeys: String, CodingKey {
        case id
        case model
        case make
        case year
        case odometer
        case longitude
        case latitude
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ConfigKeys.self)
        self.id = try values.decodeIfPresent(UUID.self, forKey: .id)!
        self.make = try values.decodeIfPresent(String.self, forKey: .make)!
        self.model = try values.decodeIfPresent(String.self, forKey: .model)!
        self.year = try values.decodeIfPresent(String.self, forKey: .year)!
        self.odometer = try values.decodeIfPresent(String.self, forKey: .odometer)
        self.longitude = try values.decodeIfPresent(Float.self, forKey: .longitude)
        self.latitude = try values.decodeIfPresent(Float.self, forKey: .latitude)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ConfigKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(make, forKey: .make)
        try container.encode(model, forKey: .model)
        try container.encode(year, forKey: .year)
        try container.encode(odometer, forKey: .odometer)
        try container.encode(longitude, forKey: .longitude)
        try container.encode(latitude, forKey: .latitude)
    }
}
