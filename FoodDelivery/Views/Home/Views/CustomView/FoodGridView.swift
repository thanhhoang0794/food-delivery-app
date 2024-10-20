//
//  FoodGridView.swift
//  FoodDelivery
//
//  Created by Henry on 19/10/2024.
//
import SwiftUI

struct FoodGridView: View {
    var foodItems: [FoodItem]
    let itemWidth: CGFloat

    var body: some View {
        LazyVGrid(columns: [
            GridItem(.fixed(itemWidth), spacing: 10),
            GridItem(.fixed(itemWidth), spacing: 10)
        ], spacing: 20) {
            ForEach(foodItems) { item in
                NavigationLink(destination: FoodDetailView(foodItem: item)) {
                    VStack(alignment: .leading, spacing: 8) {
                        CachedAsyncImage(
                            url: URL(string: item.imageName),
                            placeholder: Image(systemName: "photo")
                        )
                        .frame(width: itemWidth - 10, height: itemWidth)
                        .cornerRadius(8)

                        Text(item.name)
                            .font(.headline)
                            .lineLimit(1)
                        
                        Text(item.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .lineLimit(1)
                        
                        Text("$\(item.price, specifier: "%.2f")")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                            .lineLimit(1)
                        
                        HStack(spacing: 2) {
                            // Use a ForEach loop over a fixed range [0, 1, 2, 3, 4], ensuring it doesn't throw an error
                            ForEach(0..<5) { index in
                                Image(systemName: index < Int(item.rating) ? "star.fill" : "star")
                                    .foregroundColor(.yellow)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(5)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 3)
                }
            }
        }
        .padding([.leading, .trailing], 10)
    }
}
