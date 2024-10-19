import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: FoodListViewModel

    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchText)
                .padding()
            // List with sections based on FoodType
            List {
                ForEach(viewModel.sectionedFoodItems.keys.sorted(by: { $0.rawValue < $1.rawValue }), id: \.self) { foodType in
                    Section(header: Text(foodType.rawValue)) {
                        ForEach(viewModel.sectionedFoodItems[foodType] ?? []) { item in
                            NavigationLink(destination: FoodDetailView(foodItem: item)) {
                                HStack {
                                    // AsyncImage with state handling
                                    AsyncImage(url: URL(string: item.imageName)) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView() // Show loading indicator
                                                .frame(width: 50, height: 50)
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .cornerRadius(8)
                                                .frame(width: 50, height: 50)
                                        case .failure:
                                            Image(systemName: "xmark.octagon.fill") // Fallback image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                                .foregroundColor(.red)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }

                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        Text("$\(item.price, specifier: "%.2f")")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    HStack(spacing: 2) {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Search")
    }
}
