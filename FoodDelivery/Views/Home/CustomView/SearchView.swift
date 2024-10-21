//
//  SearchView.swift
//  FoodDelivery
//
//  Created by Henry on 19/10/2024.
//
import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: FoodListViewModel

    var body: some View {
        VStack {
            List {
                ForEach(viewModel.sectionedFoodItemsByCategory.keys.sorted(), id: \.self) { letter in
                    Section(header: Text(letter)) {
                        ForEach(viewModel.sectionedFoodItemsByCategory[letter] ?? []) { item in
                            NavigationLink(destination: FoodDetailView(foodItem: item)) {
                                CachedAsyncImage(
                                    url: URL(string: item.imageName),
                                    placeholder: Image(systemName: "photo")
                                )
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)

                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                        .lineLimit(1)
                                    Text(item.description)
                                        .font(.subheadline)
                                        .lineLimit(2)
                                    Text("$\(item.price, specifier: "%.2f")")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                HStack(spacing: 2) {
                                    Text("\(item.rating, specifier: "%.1f")")
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                SearchBar(text: $viewModel.searchText)
                    .padding(.horizontal) // Optional padding
            }
        }
    }
}
