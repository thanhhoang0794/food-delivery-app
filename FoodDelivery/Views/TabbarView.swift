//
//  TabbarView.swift
//  FoodDelivery
//
//  Created by Henry on 19/10/2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            FoodListMainView()
                .tabItem {
                    Image(systemName: "house.fill") // Home icon
                    Text("Home")
                }
            
            // Order Tab
            OrderView()
                .tabItem {
                    Image(systemName: "cart.fill") // Shopping cart icon for Orders
                    Text("Order")
                }
            
            // Profile Tab
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill") // User icon for Profile
                    Text("Profile")
                }
            
            // Checkout Tab
            CheckoutView()
                .tabItem {
                    Image(systemName: "creditcard.fill") // Credit card icon for Checkout
                    Text("Checkout")
                }
        }
    }
}
