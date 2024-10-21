//
//  APIHelper.swift
//  FoodDelivery
//
//  Created by Henry on 19/10/2024.
//

import Foundation
import Alamofire

class APIHelper {
    static let baseUrl = "https://www.themealdb.com/api/json/v1/1"
    
    static func buildHeaders() -> HTTPHeaders {
        return ["Content-Type": "application/json"]
    }
}
