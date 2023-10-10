//
//  VehicleLocationView.swift
//  Cars
//
//  Created by William Mooney on 10/9/23.
//

import SwiftUI
import MapKit

struct VehicleLocationView: View {
    var vehicle: Vehicle

    var body: some View {
        if vehicle.latitude != nil {
            Map {
                Marker(vehicle.model, coordinate: CLLocationCoordinate2D(latitude: Double(vehicle.latitude!), longitude: Double(vehicle.longitude!)))
            }
        }
    }
}

#Preview {
    VehicleLocationView(vehicle: Vehicle(uuid: UUID(), model: "Volkswagen", make: "Jetta", year: "2016", latitude: 37.773972, longitude: -122.431297))
}
