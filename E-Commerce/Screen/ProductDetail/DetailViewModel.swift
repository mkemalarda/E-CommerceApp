//
//  DetailViewModel.swift
//  E-Commerce
//
//  Created by Mustafa Kemal ARDA on 13.12.2024.
//

import Foundation

protocol DetailViewModelDelegate: AnyObject {
    func didUpdatePrice(_ price: String)
    func didUpdateButtonTitle(_ title: String)
}

class DetailViewModel {

    let product: Product
    private(set) var isInCart: Bool {
        didSet {
            delegate?.didUpdateButtonTitle(isInCart ? "Remove from Cart" : "Add to Cart")
        }
    }
    
    var productImageUrl: String { product.image ?? "" }
    var productName: String { product.name ?? "" }
    var productDescription: String { product.description ?? "" }
    var productPrice: String { "\(product.price ?? "0")₺" }
    
    weak var delegate: DetailViewModelDelegate?
    private let cartManager = CartManager()
    
    init(product: Product, isInCart: Bool) {
        self.product = product
        self.isInCart = isInCart
    }
    
    func toggleCartStatus() {
        isInCart.toggle()
        
        if isInCart {
            cartManager.addToCart(item: product)
        } else {
            cartManager.removeFromCart(item: product)
        }
        
        delegate?.didUpdateButtonTitle(isInCart ? "Remove from Cart" : "Add to Cart")
    }
}
