//
//  FoodItem.swift
//  FoodDelivery
//
//  Created by Henry on 19/10/2024.
//

import Foundation

enum FoodType: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case all = "All"
    case vegetarian = "Vegetarian"
    case healthy = "Healthy"
}

struct FoodItem: Identifiable {
    let id: UUID = UUID() // Default value for `id`
    let name: String
    let description: String
    let price: Double
    let imageName: String // The image name for the food item
    let type: FoodType
    let rating: Double // Rating value (1-5)
}


