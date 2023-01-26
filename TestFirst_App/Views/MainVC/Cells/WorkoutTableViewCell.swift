//
//  WorkoutTableViewCell.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 26/01/23.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {
    
    private let workoutView = WorkoutViewForCell()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        //selectionStyle = .none
        backgroundColor = .clear
        addSubview(workoutView)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            workoutView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            workoutView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            workoutView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            workoutView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
    }
    
}
