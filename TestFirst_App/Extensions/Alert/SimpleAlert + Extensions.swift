//
//  SimpleAlert.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 02/02/23.
//

import UIKit

extension UIViewController {
    
    func alertOk(title: String, message: String?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(ok)
        
        present(alertController, animated: true, completion: nil)
    }
}
