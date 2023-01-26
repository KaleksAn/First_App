//
//  WorkoutViewForCell.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 26/01/23.
//

import UIKit

class WorkoutViewForCell: UIView {
    
    private let workoutImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = .init(named: "imageCell")
        imageView.backgroundColor = .specialBackground
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let workoutNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Pull Ups"
        label.font = .robotBold20()
        label.textColor = .specialBlack
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let repsLabel: UILabel = {
       let label = UILabel()
        label.text = "Reps: 20"
        label.font = .robotMedium14()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let setsLabel: UILabel = {
        let label = UILabel()
         label.text = "Sets: 4"
         label.font = .robotMedium14()
         label.textColor = .specialBlack
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
    }()
    
    private var stackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let startButton: UIButton = {
       let button = UIButton()
        button.setTitle("START", for: .normal)
        button.setTitleColor(.specialDarkGreen, for: .normal)
        button.backgroundColor = .specialYellow
        button.titleLabel?.font = .robotMedium18()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .specialBrown
        layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(workoutImageView)
        addSubview(workoutNameLabel)
        stackView.addArrangedSubview(repsLabel)
        stackView.addArrangedSubview(setsLabel)
        addSubview(stackView)
        addSubview(startButton)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            workoutImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            workoutImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            workoutImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            workoutImageView.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            workoutNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            workoutNameLabel.leadingAnchor.constraint(equalTo: workoutImageView.trailingAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: workoutImageView.trailingAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            startButton.leadingAnchor.constraint(equalTo: workoutImageView.trailingAnchor, constant: 5),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
    }

}
