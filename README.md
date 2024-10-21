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

## Screenshots
| ![Screenshot 1](https://i.ibb.co/pX63Dn5/thumnail.png) | ![Screenshot 2](https://i.ibb.co/QpkTSWt/Simulator-Screenshot-i-Phone-15-2024-10-21-at-13-19-07.png) | ![Screenshot 3](https://i.ibb.co/C0BfBYP/Simulator-Screenshot-i-Phone-15-2024-10-21-at-13-19-19.png) | ![Screenshot 4](https://i.ibb.co/FXndt07/Simulator-Screenshot-i-Phone-15-2024-10-21-at-13-24-53.png) | ![Screenshot 5](https://i.ibb.co/GHJV27W/Simulator-Screenshot-i-Phone-15-2024-10-21-at-13-24-43.png) |
|---|---|---|---|---|


## Video Demo

Click image to watch the demo of the FoodDelivery app on Vimeo:

<a href="https://vimeo.com/1021588384?share=copy" target="_blank">
    <img src="https://i.ibb.co/pX63Dn5/thumnail.png" alt="FoodDelivery Video Demo" width="320" />
</a>

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/thanhhoang0794/food-delivery-app.git
   cd food-delivery-app
2. Open the project workspace in Xcode:
    ```bash
    open FoodDelivery.xcworkspace
3. Select the scheme FoodApp from the scheme dropdown in the Xcode toolbar.
4. Select your target device or simulator from the Xcode toolbar.
5. Build and run the app:
- Click the "Run" button (▶️) in the Xcode toolbar, or use the keyboard shortcut Cmd + R.
