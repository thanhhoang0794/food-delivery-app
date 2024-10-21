//
//  APIService.swift
//  FoodDelivery
//
//  Created by Henry on 19/10/2024.
//

import Foundation
import Alamofire

class APIService {
    static let shared = APIService()
    
    private init() {}
    
    // Function to fetch categories (already defined)
    func fetchCategories(completion: @escaping (Result<[Category], Error>) -> Void) {
        NetworkManager.shared.request(.fetchCategories) { (result: Result<CategoryResponse, Error>) in
            switch result {
            case .success(let categoryResponse):
                completion(.success(categoryResponse.categories))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    // Function to fetch meals by category
    func fetchMeals(forCategory category: String, completion: @escaping (Result<[Meal], Error>) -> Void) {
        NetworkManager.shared.request(.getListMealByCategories(id: category)) { (result: Result<MealResponse, Error>) in
            switch result {
            case .success(let mealResponse):
                completion(.success(mealResponse.meals))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
