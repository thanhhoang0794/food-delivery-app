//
//  Categories.swift
//  FoodDelivery
//
//  Created by Henry on 20/10/2024.
//

import Foundation
enum FoodType: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case all = "All"
    case vegetarian = "Vegetarian"
    case healthy = "Healthy"
}

struct CategoryResponse: Codable {
    let categories: [Category]
}

// MARK: - Category Model
struct Category: Codable, Identifiable, Hashable {
    var id: String { self.idCategory }
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}
