//
//  UIViewController+Extension.swift
//  E-Commerce
//
//  Created by Mustafa Kemal ARDA on 13.12.2024.
//

import UIKit

extension UIViewController {
    func showAlert(title: String = "Success!", message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

