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
    
    private let setsLabel: UILabel = {
       let label = UILabel()
        label.text = "Sets"
        label.textColor = .specialGray
        label.font = .robotMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numbersSets: UILabel = {
       let label = UILabel()
        label.text = "1/4"
        label.textColor = .specialGray
        label.font = .robotMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var setsStackView = UIStackView()

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
        
        setsStackView = UIStackView(arrangedSubviews: [setsLabel, numbersSets], axis: .horizontal, spacing: 10)
        addSubview(setsStackView)
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            bicepsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            bicepsLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            setsStackView.topAnchor.constraint(equalTo: bicepsLabel.bottomAnchor, constant: 15),
            setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
    }
    
}
