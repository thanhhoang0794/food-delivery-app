//
//  ImageCache.swift
//  FoodDelivery
//
//  Created by Henry on 20/10/2024.
//

import SwiftUI
import Combine

class ImageCache {
    static let shared = ImageCache()
    
    private var cache = NSCache<NSString, UIImage>()
    
    func getImage(forKey key: String) -> UIImage? {
        return cache.object(forKey: NSString(string: key))
    }
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: NSString(string: key))
    }
}

struct CachedAsyncImage: View {
    let url: URL?
    let placeholder: Image
    
    @State private var image: UIImage? = nil
    @State private var cancellable: AnyCancellable?
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
            } else {
                placeholder
                    .resizable()
            }
        }
        .onAppear {
            loadImage()
        }
        .onDisappear {
            cancellable?.cancel()
        }
    }
    
    private func loadImage() {
        guard let url = url else { return }
        // Check if the image is cached
        if let cachedImage = ImageCache.shared.getImage(forKey: url.absoluteString) {
            self.image = cachedImage
            return
        }
        // Otherwise, download the image
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { image in
                if let image = image {
                    self.image = image
                    // Cache the downloaded image
                    ImageCache.shared.setImage(image, forKey: url.absoluteString)
                }
            }
    }
}
