//
//  DetailsView.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 04/02/23.
//

import UIKit

class DetailsView: UIView {
    
    private let bicepsLabel: UILabel = {
       let label = UILabel()
        label.text = "Biceps"
        label.textColor = .specialGray
        label.font = .robotBold20()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .specialBrown
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        addSubview(bicepsLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            bicepsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            bicepsLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}
