//
//  APIEndPoint.swift
//  FoodDelivery
//
//  Created by Henry on 19/10/2024.
//

import Foundation
import Alamofire

enum APIEndpoint {
    case fetchCategories
    case getListMealByCategories(id: String)
    
    var path: String {
        switch self {
        case .fetchCategories:
            return "/categories.php"
        case .getListMealByCategories(let id):
            return "/filter.php?c=\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchCategories, .getListMealByCategories:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getListMealByCategories(let id):
            return nil
        default:
            return nil
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .fetchCategories, .getListMealByCategories:
            return ["Content-Type": "application/json"]
        }
    }
}
