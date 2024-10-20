//
//  FoodItem.swift
//  FoodDelivery
//
//  Created by Henry on 19/10/2024.
//

import Foundation

// MARK: - Meal Response Model
struct MealResponse: Codable {
    let meals: [Meal]
}

// MARK: - Meal Model
struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
// MARK: - FoodItem Model (Custom Model for UI)
struct FoodItem: Identifiable {
    let id: UUID = UUID() // Default value for `id`
    let name: String
    let description: String
    let price: Double
    let imageName: String // The image name or URL for the food item
    let type: FoodType
    let rating: Double // Rating value (1-5)
}


