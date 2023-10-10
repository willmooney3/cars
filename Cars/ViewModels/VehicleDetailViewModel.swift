//
//  VehicleDetailViewModel.swift
//  Cars
//
//  Created by William Mooney on 10/9/23.
//

import Alamofire

class VehicleDetailViewModel : ObservableObject {
    @Published var vehicle: Vehicle = Vehicle()

    func getUserVehicle(accessToken: String, vehicleID: String) {
        AF.request("\(Config.API_URL)/vehicles/\(vehicleID)?access_token=\(accessToken)").responseDecodable(of: VehicleDetailResponse.self) { response in
            switch response.result {
            case .success(let value):
                self.vehicle = value.vehicle
            case .failure(let error):
               print(error)
            }
        }
    }
}
