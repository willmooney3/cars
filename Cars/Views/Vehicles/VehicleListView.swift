//
//  VehicleListView.swift
//  Cars
//
//  Created by William Mooney on 10/9/23.
//

import SwiftUI

struct VehicleListView: View {
    @EnvironmentObject private var authModel: AuthModel
    @ObservedObject private var listViewModel: VehicleListViewModel = VehicleListViewModel()

    func getVehicles() {
        listViewModel.getUserVehicles(accessToken: authModel.accessToken)
    }

    var body: some View {
        NavigationStack {
            List(listViewModel.vehicles) {vehicle in
                VStack {
                    NavigationLink(destination: VehicleDetailView(vehicle: vehicle).environmentObject(authModel)) {
                        Text("\(vehicle.year) \(vehicle.make) \(vehicle.model)")
                            .font(.headline)
                    }
                }.navigationTitle("Vehicles")
            }
        }.onAppear(perform: getVehicles)
    }
}

#Preview {
    VehicleListView()
}
