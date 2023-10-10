//
//  VehicleListViewModel.swift
//  Cars
//
//  Created by William Mooney on 10/9/23.
//

import Alamofire

class VehicleListViewModel : ObservableObject {
    @Published var vehicles: [Vehicle] = []

    func getUserVehicles(accessToken: String) {
        AF.request("\(Config.API_URL)/vehicles?access_token=\(accessToken)"){$0.timeoutInterval = 60}.responseDecodable(of: VehicleListResponse.self) { response in
            switch response.result {
            case .success(let value):
                self.vehicles = value.vehicles
            case .failure(let error):
               print(error)
            }
        }
    }
}
