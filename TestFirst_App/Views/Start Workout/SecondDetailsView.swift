//
//  SecondDetailsView.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 19/02/23.
//

import UIKit

class SecondDetailsView: UIView {

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
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        
    }

}
