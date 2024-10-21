//
//  FoodListViewModel.swift
//  FoodDelivery
//
//  Created by Henry on 19/10/2024.
//

import Foundation
import Combine

class FoodListViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var foodItems: [FoodItem] = []
    @Published var selectedCategory: Category? {
        didSet {
            fetchMeals(forceReload: true)
        }
    }
    @Published var listCategory: [Category] = []
    @Published var isLoading: Bool = false // Add loading state
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchCategories()
        
        // Observe the search text and filter food items
        $searchText
            .debounce(for: .seconds(2), scheduler: RunLoop.main) // Delay for filtering
            .sink(receiveValue: { [weak self] _ in
                self?.fetchMeals()
            })
            .store(in: &cancellables)
    }
    
    func fetchCategories() {
        isLoading = true // Set loading state
        
        APIService.shared.fetchCategories { [weak self] results in
            guard let self = self else { return }
            self.isLoading = false // Reset loading state
            
            switch results {
            case .success(let categories):
                self.selectedCategory = categories.first
                self.listCategory = categories
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func fetchMeals(forceReload: Bool = false) {
        // If foodItems is already populated and forceReload is false, do nothing
        if !forceReload && !foodItems.isEmpty {
            return
        }
        
        guard let category = selectedCategory?.strCategory else { return }
        isLoading = true // Set loading state
        
        APIService.shared.fetchMeals(forCategory: category) { [weak self] results in
            guard let self = self else { return }
            self.isLoading = false // Reset loading state
            
            switch results {
            case .success(let meals):
                self.foodItems = meals.map { meal in
                    FoodItem(
                        name: meal.strMeal,
                        description: self.selectedCategory?.strCategoryDescription ?? "",
                        price: Double.random(in: 1..<100),
                        imageName: meal.strMealThumb,
                        type: .all,
                        rating: Double.random(in: 1..<5)
                    )
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    var filteredFoodItems: [FoodItem] {
        return filterFoodItems()
    }
    
    private func filterFoodItems() -> [FoodItem] {
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
