//
//  FoodListMainView.swift
//  FoodDelivery
//
//  Created by Henry on 19/10/2024.
//
import SwiftUI

struct FoodListMainView: View {
    @StateObject var viewModel = FoodListViewModel()
    @State private var isGridView = false
    
    var body: some View {
        NavigationView {
            VStack {
                if isGridView {
                    GeometryReader { geometry in
                        let itemWidth = (geometry.size.width - 40) / 2
                        ScrollView {
                            FoodGridView(foodItems: viewModel.filteredFoodItems, itemWidth: itemWidth)
                        }.refreshable {
                            viewModel.fetchMeals(forceReload: true)
                        }
                    }
                } else {
                    FoodListContentView(foodItems: viewModel.filteredFoodItems)
                        .refreshable {
                            // Only fetch data when the user pulls down to refresh
                            viewModel.fetchMeals(forceReload: true)
                        }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    VStack {
                        HStack(spacing: 5) {
                            Picker("Select Food Type", selection: $viewModel.selectedCategory) {
                                ForEach(viewModel.listCategory) { category in
                                    Text(category.strCategory).tag(category as Category?)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            Image(systemName: "chevron.down")
                                .font(.caption)
                            Button(action: {
                                isGridView.toggle()
                            }) {
                                Image(systemName: isGridView ? "square.grid.2x2.fill" : "list.bullet")
                            }
                            
                            NavigationLink(destination: SearchView(viewModel: viewModel)) {
                                Image(systemName: "magnifyingglass")
                            }
                        }
                    }
                }
            }
            .onAppear {
                // Fetch meals only if they haven't been loaded yet
                if viewModel.foodItems.isEmpty {
                    viewModel.fetchMeals(forceReload: false)
                }
            }
        }
    }
}
