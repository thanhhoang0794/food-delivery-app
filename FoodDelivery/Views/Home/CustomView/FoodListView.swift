//
//  FoodListContentView.swift
//  FoodDelivery
//
//  Created by Henry on 19/10/2024.
//
import SwiftUI

struct FoodListContentView: View {
    var foodItems: [FoodItem]

    var body: some View {
        List(foodItems) { item in
            NavigationLink(destination: FoodDetailView(foodItem: item)) {
                HStack {
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
