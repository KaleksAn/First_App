//
//  WorkoutTableViewCell.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 26/01/23.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {
    
    private let backgroundWorkoutView: UIView = {
       let view = UIView()
        view.backgroundColor = .specialBrown
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backgroundImageView: UIView = {
       let view = UIView()
        view.backgroundColor = .specialBackground
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let workoutImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "imageCell")
        imageView.backgroundColor = .specialBackground
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        selectionStyle = .none
        backgroundColor = .clear
        addSubview(backgroundWorkoutView)
        addSubview(backgroundImageView)
        addSubview(workoutImageView)
    }
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            backgroundWorkoutView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundWorkoutView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            backgroundWorkoutView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backgroundWorkoutView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            backgroundImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backgroundImageView.widthAnchor.constraint(equalToConstant: 80.0),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 80.0)
        ])
        
        NSLayoutConstraint.activate([
            workoutImageView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 5),
            workoutImageView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -5),
            workoutImageView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 5),
            workoutImageView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -5)
        ])
        
    }
    
}
