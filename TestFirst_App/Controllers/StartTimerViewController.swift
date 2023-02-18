//
//  StartTimerViewController.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 19/02/23.
//

import UIKit

class StartTimerViewController: UIViewController {
    
    private let startWorkout: UILabel = {
       let label = UILabel()
        label.text = "START WORKOUT"
        label.textAlignment = .center
        label.textColor = .specialGray
        label.font = .robotMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let close: UIButton = {
        let image = UIImage(named: "closeButton")?.withRenderingMode(.alwaysOriginal)
        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 10
        //button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let timer: UILabel = {
       let label = UILabel()
        label.text = "01:30"
        label.font = .robotMedium24()
        label.textColor = .specialBlack
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let circle: UIImageView = {
       let image = UIImage(named: "Ellipse")
        let imageView = UIImageView()
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
    }
    
    private func setupConstraints() {
        
    }
    
}
