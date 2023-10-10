//
//  VehicleDetailView.swift
//  Cars
//
//  Created by William Mooney on 10/9/23.
//

import SwiftUI
import MapKit
import Charts

struct VehicleDetailView: View {
    @EnvironmentObject private var authModel: AuthModel
    @ObservedObject private var detailViewModel: VehicleDetailViewModel = VehicleDetailViewModel()
    @State var vehicle: Vehicle = Vehicle()

    func getVehicle() {
        detailViewModel.getUserVehicle(accessToken: authModel.accessToken, vehicleID: self.vehicle.id.uuidString)
    }

    var body: some View {
        VStack {
            VehicleLocationView(vehicle: self.detailViewModel.vehicle).frame(width: .infinity, height: 250)
            Text("\(self.detailViewModel.vehicle.year) \(self.detailViewModel.vehicle.make) \(self.detailViewModel.vehicle.model)").font(.headline)
            
            Text("Odometer: \(self.detailViewModel.vehicle.odometer ?? "")")
            Spacer()
        }.onAppear(perform: getVehicle)
    }
}

#Preview {
    VehicleDetailView()
}
