//
//  ProfileController.swift
//  E-Commerce
//
//  Created by Mustafa Kemal ARDA on 13.12.2024.
//

import UIKit

final class ProfileController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    func configureUI() {
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.isHidden = true
        
        let headerView: HeaderView = {
            let view = HeaderView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.titleLabel.text = "Profile"
            return view
        }()
        view.addSubview(headerView)
        headerView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          left: view.leftAnchor,
                          right: view.rightAnchor,
                          height: 60)
    }
}
