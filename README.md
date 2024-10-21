# FoodDelivery App

A SwiftUI application that allows users to explore various food items, view detailed descriptions, and manage their selections. The app fetches food categories and items from a remote API, displaying images dynamically while implementing caching for better performance.

## Features

- **API Integration**: Fetches food categories and items from [TheMealDB API](https://www.themealdb.com/api.php).
- **Dynamic UI**: Implements a user-friendly interface with category pickers and lists of food items.
- **Custom Food Model**: Utilizes a structured data model (`FoodItem`) to manage food information. 
  - Adds random values for **price** (ranging from $1 to $100) and **rating** (ranging from 1 to 5) to enhance the user experience, compensating for missing data from the API.
- **Image Caching**: Caches images to enhance performance and reduce loading times on re-navigation.

## Design Pattern

### MVVM (Model-View-ViewModel)

The FoodDelivery app follows the Model-View-ViewModel (MVVM) design pattern to enhance modularity, testability, and maintainability.

- **Model**: 
  - Represents the data structures used in the app, such as `FoodItem` and `Category`. The Model handles the data and business logic, including fetching data from the API.
  
- **View**: 
  - The user interface of the application, built using SwiftUI. It includes views like `FoodListMainView` and `FoodDetailView`, which present data to the user and respond to user interactions.

- **ViewModel**: 
  - Acts as a bridge between the Model and the View. It contains the presentation logic and handles user input. For instance, the `FoodListViewModel` fetches categories and food items from the API, formats the data, and provides it to the views. The ViewModel is observable, allowing the UI to update automatically when data changes.

This separation of concerns allows for a more organized codebase and easier unit testing, as each component has a distinct role in the application.

## Technologies Used

- SwiftUI
- Combine
- AsyncImage for asynchronous image loading
- Alamofire

## Video Demo

Watch the demo of the FoodDelivery app on Vimeo:

[![FoodDelivery Video Demo](https://i.ibb.co/pX63Dn5/thumnail.png)]((https://vimeo.com/1021588384?share=copy))

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/thanhhoang0794/food-delivery-app.git
   cd FoodDelivery
