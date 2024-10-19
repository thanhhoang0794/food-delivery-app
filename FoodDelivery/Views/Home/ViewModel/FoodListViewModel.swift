//
//  FoodListViewModel.swift
//  FoodDelivery
//
//  Created by Henry on 19/10/2024.
//

import Foundation

class FoodListViewModel: ObservableObject {
    @Published var selectedFoodType: FoodType = .all
    @Published var searchText: String = ""
    @Published var foodItems: [FoodItem] = []
    
    init() {
        // Generate random food items with random images
        self.foodItems = [
            FoodItem(name: "Pizza Margherita", description: "Classic Italian pizza", price: 15.0, imageName: randomImageUrl(), type: .vegetarian, rating: 2),
            FoodItem(name: "Fresh Salad", description: "Healthy green salad", price: 10.0, imageName: randomImageUrl(), type: .healthy, rating: 5),
            FoodItem(name: "Grilled Veggie Sandwich", description: "Grilled veggies on whole grain bread", price: 12.0, imageName: randomImageUrl(), type: .vegetarian, rating: 3),
            FoodItem(name: "Smoothie Bowl", description: "Fruits, granola, and seeds", price: 9.5, imageName: randomImageUrl(), type: .healthy, rating: 4),
            FoodItem(name: "Avocado Toast", description: "Toast topped with fresh avocado", price: 8.5, imageName: randomImageUrl(), type: .vegetarian, rating: 1)
        ]
    }
    
    // Function to return a random image URL
    private func randomImageUrl() -> String {
//        let imageSize = Int.random(in: 200...500) // You can change size as needed
        return "https://img.freepik.com/free-photo/big-sandwich-hamburger-burger-with-beef-red-onion-tomato-fried-bacon_2829-5398.jpg?semt=ais_hybrid"
    }
    
    var filteredFoodItems: [FoodItem] {
        let filteredByType = selectedFoodType == .all ? foodItems : foodItems.filter { $0.type == selectedFoodType }
        return searchText.isEmpty ? filteredByType : filteredByType.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    // Section food items by FoodType
    var sectionedFoodItems: [FoodType: [FoodItem]] {
        Dictionary(grouping: filteredFoodItems, by: { $0.type })
    }
}
