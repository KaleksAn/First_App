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
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    }
    
    private func setupConstraints() {
        NSLayoutConstraint
    }

}
