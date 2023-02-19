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
        label.font = .robotoBold48()
        label.textColor = .specialBlack
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let circle: UIImageView = {
       let image = UIImage(named: "Ellipse")
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let details = UILabel(text: "Details")
    private let detailsView = SecondDetailsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        close.layer.cornerRadius = close.frame.width / 2
    }
    
    //MARK - Setup Views
    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(startWorkout)
        view.addSubview(close)
        view.addSubview(circle)
        view.addSubview(timer)
        view.addSubview(details)
        view.addSubview(detailsView)
    }
    
    
    
}

//MARK - Setup constraints
extension StartTimerViewController {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            startWorkout.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            startWorkout.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            close.centerYAnchor.constraint(equalTo: startWorkout.centerYAnchor),
            close.leadingAnchor.constraint(equalTo: startWorkout.trailingAnchor, constant: 10),
            close.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            close.heightAnchor.constraint(equalToConstant: 30),
            close.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            circle.topAnchor.constraint(equalTo: startWorkout.bottomAnchor, constant: 25),
            circle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            circle.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
        ])
        
        NSLayoutConstraint.activate([
            timer.centerXAnchor.constraint(equalTo: circle.centerXAnchor),
            timer.centerYAnchor.constraint(equalTo: circle.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            details.topAnchor.constraint(equalTo: circle.bottomAnchor, constant: 10),
            details.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            details.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            detailsView.topAnchor.constraint(equalTo: details.bottomAnchor, constant: 5),
            detailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            detailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            detailsView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
    }
    
}
