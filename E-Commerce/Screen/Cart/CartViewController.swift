//
//  CartViewController.swift
//  E-Commerce
//
//  Created by Mustafa Kemal ARDA on 13.12.2024.
//

import UIKit

final class CartViewController: UIViewController {
    
    var viewModel = CartViewModel()
    let cartView = CartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
        configureNavBar()
        viewModel.onCartUpdated = { [weak self] in
            guard let self = self else { return }
            self.updateUI()
        }
        updateUI()
    }
    
    private func setupView() {
        view.addSubview(cartView)
        cartView.anchor(top: view.topAnchor,
                        left: view.leftAnchor,
                        bottom: view.bottomAnchor,
                        right: view.rightAnchor)
        
        cartView.tableView.delegate = self
        cartView.tableView.dataSource = self
        
        cartView.tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "productCell")
    }
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupBindings() {
        cartView.tableView.reloadData()
    }
    
    func updateUI() {
        let isCartEmpty = viewModel.cartItems.isEmpty
        cartView.updateCartView(isEmpty: isCartEmpty)
        cartView.tableView.reloadData()
        let totalPrice = viewModel.getTotalPrice()
        cartView.updateTotalPrice(with: totalPrice)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductTableViewCell else {
            fatalError("Unable to dequeue ProductTableViewCell")
        }
        let product = viewModel.cartItems[indexPath.row]
        cell.selectionStyle = .none
        cell.configure(with: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
