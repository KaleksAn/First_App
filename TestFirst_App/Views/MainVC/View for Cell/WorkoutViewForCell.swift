//
//  WorkoutViewForCell.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 26/01/23.
//

import UIKit

class WorkoutViewForCell: UIView {

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
    }
    
    private func setupConstraints() {
        
    }

}
