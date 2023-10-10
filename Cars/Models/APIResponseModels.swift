//
//  APIResponseModels.swift
//  Cars
//
//  Created by William Mooney on 10/9/23.
//

import Foundation

class AuthResponse: Codable {
    var accessToken: String

    init(model: String) {
        self.accessToken = model
    }

    enum ConfigKeys: String, CodingKey {
        case accessToken
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ConfigKeys.self)
        self.accessToken = try values.decodeIfPresent(String.self, forKey: .accessToken)!
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ConfigKeys.self)
        try container.encode(accessToken, forKey: .accessToken)
    }
}

class VehicleListResponse: Codable {
    var vehicles: [Vehicle]

    init(vehicles: [Vehicle]) {
        self.vehicles = vehicles
    }

    enum ConfigKeys: String, CodingKey {
        case vehicles
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ConfigKeys.self)
        self.vehicles = try values.decodeIfPresent([Vehicle].self, forKey: .vehicles)!
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ConfigKeys.self)
        try container.encode(vehicles, forKey: .vehicles)
    }
}

class VehicleDetailResponse: Codable {
    var vehicle: Vehicle

    init(vehicle: Vehicle) {
        self.vehicle = vehicle
    }

    enum ConfigKeys: String, CodingKey {
        case vehicle
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ConfigKeys.self)
        self.vehicle = try values.decodeIfPresent(Vehicle.self, forKey: .vehicle)!
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ConfigKeys.self)
        try container.encode(vehicle, forKey: .vehicle)
    }
}
