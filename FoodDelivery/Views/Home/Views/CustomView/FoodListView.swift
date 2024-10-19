//
//  CheckoutView.swift
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
                    // Use AsyncImage to load images from URLs
                    AsyncImage(url: URL(string: item.imageName)) { image in
                        image
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(8)
                    } placeholder: {
                        // Show a placeholder while loading
                        ProgressView()
                            .frame(width: 50, height: 50)
                    }

                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.description)
                            .font(.subheadline)
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
