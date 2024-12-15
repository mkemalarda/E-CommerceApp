//
//  MockProductService.swift
//  E-Commerce
//
//  Created by Mustafa Kemal ARDA on 13.12.2024.
//

import Foundation

class MockProductService: ProductServiceProtocol {
    var shouldReturnError = false
    var productsToReturn: [Product] = []
    
    func fetchMoreProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mock error"])))
        } else {
            completion(.success(productsToReturn))
        }
    }
    
    func searchProducts(query: String, completion: @escaping (Result<[Product], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mock error"])))
        } else {
            let filteredProducts = productsToReturn.filter { product in
                guard let name = product.name else { return false }
                return name.lowercased().contains(query.lowercased())
            }
            completion(.success(filteredProducts))
        }
    }
    
    func fetchAllProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mock error"])))
        } else {
            completion(.success(productsToReturn))
        }
    }
}
