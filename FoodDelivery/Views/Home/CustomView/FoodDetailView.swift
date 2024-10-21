//
//  FoodDetailView.swift
//  FoodDelivery
//
//  Created by Henry on 19/10/2024.
//

import SwiftUI

struct FoodDetailView: View {
    let foodItem: FoodItem

    var body: some View {
        VStack(spacing: 20) {
            GeometryReader { geometry in
                CachedAsyncImage(
                    url: URL(string: foodItem.imageName),
                    placeholder: Image(systemName: "photo")
                )
                .frame(width: geometry.size.width, height: geometry.size.width) // Set width to fill the available space
                .clipped() // Ensure the image doesn't overflow
                .cornerRadius(8)
            }
            .frame(height: 300) // Set a fixed height for the image area

            Text(foodItem.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(foodItem.description)
                .font(.body)
                .padding()

            Text("$\(foodItem.price, specifier: "%.2f")")
                .font(.title)
                .fontWeight(.semibold)

            Spacer()
        }
        .padding()
        .navigationTitle(foodItem.name)
    }
}
