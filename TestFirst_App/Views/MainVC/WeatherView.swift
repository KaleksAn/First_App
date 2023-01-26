//
//  WeatherView.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 25/01/23.
//

import UIKit

class WeatherView: UIView {
    
    private let currentWeatherLabel: UILabel = {
       let label = UILabel()
        label.text = "Солнечно"
        label.textAlignment = .center
        label.font = .robotMedium18()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let recomendationLabel: UILabel = {
       let label = UILabel()
        label.text = "Хорошая погода, чтобы \nпозаниматься на улице"
        label.textAlignment = .center
        label.font = .robotMedium14()
        label.textColor = .specialLightBrown
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = .init(named: "sun")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        addSubview(currentWeatherLabel)
        addSubview(recomendationLabel)
        addSubview(weatherImageView)
        
        addShadowOnView()
    }

}


extension WeatherView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            currentWeatherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            currentWeatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            recomendationLabel.topAnchor.constraint(equalTo: currentWeatherLabel.bottomAnchor, constant: 5),
            recomendationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            weatherImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            weatherImageView.leadingAnchor.constraint(equalTo: recomendationLabel.trailingAnchor, constant: 30)
            //weatherImageView.heightAnchor.constraint(equalToConstant: bounds.height / 2)
        ])
        
    }
    
}
