//
//  NetworkManager.swift
//  FoodDelivery
//
//  Created by Henry on 19/10/2024.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    // Generic network request method
    func request<T: Decodable>(_ endpoint: APIEndpoint, completion: @escaping (Result<T, Error>) -> Void) {
        let url = APIHelper.baseUrl + endpoint.path
        AF.request(url, method: endpoint.method, parameters: endpoint.parameters, headers: endpoint.headers)
            .responseDecodable(of: T.self) { (response: AFDataResponse<T>) in
                switch response.result {
                case .success(let decodedData):
                    completion(.success(decodedData))
                case .failure(let afError):
                    completion(.failure(afError as Error))
                }
            }
    }
}

