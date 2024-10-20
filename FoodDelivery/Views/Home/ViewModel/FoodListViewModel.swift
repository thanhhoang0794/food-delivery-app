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
    @Published var selectedCategory: Category? {
        didSet {
            fetchMeals()
        }
    }
    @Published var listCategory: [Category] = []

    init() {
        fetchCategories()
    }
    
    func fetchCategories() {
        APIService.shared.fetchCategories { results in
            switch results {
            case .success(let categories):
                self.selectedCategory = categories.first
                self.listCategory = categories
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func fetchMeals() {
        guard let category = selectedCategory?.strCategory else { return }
        APIService.shared.fetchMeals(forCategory: category) { results in
            switch results {
            case .success(let meals):
                self.foodItems = meals.map { meal in
                    FoodItem(
                        name: meal.strMeal,
                        description: self.selectedCategory?.strCategoryDescription ?? "",
                        price: 4.0,
                        imageName: meal.strMealThumb,
                        type: .all,
                        rating: 4.0
                    )
                }
            case .failure(let err):
                print(err)
            }
        }
    }

    var filteredFoodItems: [FoodItem] {
        if searchText.isEmpty {
            return foodItems
        } else {
            return foodItems.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }

    var sectionedFoodItemsByCategory: [String: [FoodItem]] {
            let grouped = Dictionary(grouping: filteredFoodItems) { (foodItem) -> String in
                String(foodItem.name.prefix(1)) // Group by the first letter of the name
            }
            return grouped
        }
}
