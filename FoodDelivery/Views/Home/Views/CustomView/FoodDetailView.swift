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
            Image(foodItem.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 300, maxHeight: 300)

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

