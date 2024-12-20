//
//  DetailViewController.swift
//  E-Commerce
//
//  Created by Mustafa Kemal ARDA on 13.12.2024.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func didUpdateCart()
}

final class DetailViewController: UIViewController, DetailViewModelDelegate, DetailViewDelegate {
    
    let detailView = DetailView()
    private var viewModel: DetailViewModel!
    private let cartManager = CartManager()
    weak var delegate: DetailViewControllerDelegate?
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
        detailView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setupUI()
        setupBindings()
        configureNavBar()
        NotificationCenter.default.addObserver(self, selector: #selector(cartDidUpdate), name: cartManager.cartDidUpdateNotification, object: nil)
    }
    
    private func setupUI() {
        view.addSubview(detailView)
        detailView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          left: view.safeAreaLayoutGuide.leftAnchor,
                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          right: view.safeAreaLayoutGuide.rightAnchor)
        
        detailView.addToCartButton.addTarget(self, action: #selector(addToCartButtonTapped), for: .touchUpInside)
    }
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.isHidden = true
    }
    private func setupBindings() {
        detailView.configure(with: viewModel)
        updateButtonTitle()
    }
    
    @objc func addToCartButtonTapped() {
        viewModel.toggleCartStatus()
        delegate?.didUpdateCart()
    }
    
    @objc func cartDidUpdate() {
        updateButtonTitle()
    }
    
    func updateButtonTitle() {
        let buttonTitle = viewModel.isInCart ? "Remove from Cart" : "Add to Cart"
        detailView.addToCartButton.setTitle(buttonTitle, for: .normal)
    }
    
    func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func didUpdatePrice(_ price: String) {
        detailView.priceValueLabel.text = price
    }
    
    func didUpdateButtonTitle(_ title: String) {
        detailView.addToCartButton.setTitle(title, for: .normal)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
