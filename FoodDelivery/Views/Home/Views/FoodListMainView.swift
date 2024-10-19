//
//  CheckoutView.swift
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
                        }
                    }
                } else {
                    FoodListContentView(foodItems: viewModel.filteredFoodItems)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    VStack {
                        
                        HStack(spacing: 4) {
                            Picker("Select Food Type", selection: $viewModel.selectedFoodType) {
                                ForEach(FoodType.allCases) { type in
                                    Text(type.rawValue).tag(type)
                                }
                            }.pickerStyle(MenuPickerStyle())
                            
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
        }
    }
}
