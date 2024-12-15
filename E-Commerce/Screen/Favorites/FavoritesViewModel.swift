//
//  FavoritesViewModel.swift
//  E-Commerce
//
//  Created by Mustafa Kemal ARDA on 13.12.2024.
//

import Foundation

final class FavoritesViewModel {
    
    // MARK: - Properties
    private let favoriteManager = FavoriteManager()
    
    var favoriteItems: [Product] {
        return favoriteManager.favorites
    }
    
    var onFavoritesUpdated: (() -> Void)?
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(favoritesDidUpdate), name: favoriteManager.favoritesDidUpdateNotification, object: nil)
    }
    
    @objc private func favoritesDidUpdate() {
        onFavoritesUpdated?()
    }
    
    func getTotalFavorites() -> String {
        return "\(favoriteItems.count) items"
    }
    
    func toggleFavorite(for product: Product) {
        if favoriteManager.isProductInFavorites(product) {
            favoriteManager.removeFromFavorite(item: product)
        } else {
            favoriteManager.addToFavorite(item: product)
        }
    }
}
