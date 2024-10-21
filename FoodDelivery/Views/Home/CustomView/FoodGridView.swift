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
    
    private let gridItemSpacing: CGFloat = 10
    private let itemSpacing: CGFloat = 20
    private let cornerRadius: CGFloat = 8
    private let shadowRadius: CGFloat = 3

    var body: some View {
        LazyVGrid(columns: [
            GridItem(.fixed(itemWidth), spacing: gridItemSpacing),
            GridItem(.fixed(itemWidth), spacing: gridItemSpacing)
        ], spacing: itemSpacing) {
            ForEach(foodItems) { item in
                NavigationLink(destination: FoodDetailView(foodItem: item)) {
                    FoodItemView(item: item, itemWidth: itemWidth)
                }
            }
        }
        .padding([.leading, .trailing], 10)
    }
}

struct FoodItemView: View {
    var item: FoodItem
    let itemWidth: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            GeometryReader { geometry in
                CachedAsyncImage(
                    url: URL(string: item.imageName),
                    placeholder: Image(systemName: "photo")
                )
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.width)
                .clipped() // This ensures the image doesn't overflow the frame
                .cornerRadius(8)
            }
            .frame(height: itemWidth - 10) // Set height based on itemWidth
            
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
            
            RatingView(rating: item.rating)
        }
        .padding(5)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}


struct RatingView: View {
    var rating: Double
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<5) { index in
                Image(systemName: index < Int(rating) ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .font(.caption)
            }
        }
    }
}
