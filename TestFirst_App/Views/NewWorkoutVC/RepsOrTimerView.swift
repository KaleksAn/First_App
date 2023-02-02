//
//  RepsOrTimerView.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 30/01/23.
//

import UIKit

class RepsOrTimerView: UIView {
    
    private let setsLabel: UILabel = {
       let label = UILabel()
        label.text = "Sets"
        label.font = .robotMedium18()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberSetslabel: UILabel = {
       let label = UILabel()
        label.text = "1"
        label.font = .robotMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var setsSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 50
        slider.maximumTrackTintColor = .specialLightBrown
        slider.minimumTrackTintColor = .specialGreen
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(setupSetsValue), for: .valueChanged)
        return slider
    }()
    
    private let chooseLabel: UILabel = {
       let label = UILabel()
        label.text = "Choose repeat or timer"
        label.textAlignment = .center
        label.textColor = .specialLightBrown
        label.font = .robotMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsLabel: UILabel = {
       let label = UILabel()
        label.text = "Reps"
        label.font = .robotMedium18()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberRepslabel: UILabel = {
       let label = UILabel()
        label.text = "1"
        label.font = .robotMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var repsSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 50
        slider.maximumTrackTintColor = .specialLightBrown
        slider.minimumTrackTintColor = .specialGreen
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(setupRepsValue), for: .valueChanged)
        return slider
    }()
    
    private let timerLabel: UILabel = {
       let label = UILabel()
        label.text = "Timer"
        label.font = .robotMedium18()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeLabel: UILabel = {
       let label = UILabel()
        label.text = "1 min"
        label.font = .robotMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var timerSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 600
        slider.maximumTrackTintColor = .specialLightBrown
        slider.minimumTrackTintColor = .specialGreen
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(setupTimerValue), for: .valueChanged)
        return slider
    }()
    
    private var setsStackView = UIStackView()
    private var repsStackView = UIStackView()
    private var timerStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Views
    
    private func setupViews() {
        backgroundColor = .specialBrown
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        
        setsStackView = UIStackView(arrangedSubviews: [setsLabel, numberSetslabel], axis: .horizontal, spacing: 10)
        addSubview(setsStackView)
        repsStackView = UIStackView(arrangedSubviews: [repsLabel, numberRepslabel], axis: .horizontal, spacing: 10)
        addSubview(repsStackView)
        timerStackView = UIStackView(arrangedSubviews: [timerLabel, timeLabel], axis: .horizontal, spacing: 10)
        addSubview(timerStackView)
        
        addSubview(setsSlider)
        addSubview(chooseLabel)
        addSubview(repsSlider)
        addSubview(timerSlider)
    }
    
    
    //MARK: - Selectors methods
    
    @objc
    private func setupSetsValue() {
        numberSetslabel.text = "\(Int(setsSlider.value))"
    }
    
    @objc
    private func setupRepsValue() {
        numberRepslabel.text = "\(Int(repsSlider.value))"
        deactivateStatus(for: timerLabel, numberLabel: timeLabel, and: timerSlider)
        activateStatus(for: repsLabel, numberLabel: numberRepslabel, and: repsSlider)
    }
    
    @objc
    private func setupTimerValue() {
        let (min, sec) = { return ($0 / 60, $0 % 60) }(Int(timerSlider.value))
        timeLabel.text = sec == 0 ? "\(min) min" : "\(min) min \(sec) sec"
        deactivateStatus(for: repsLabel, numberLabel: numberRepslabel, and: repsSlider)
        activateStatus(for: timerLabel, numberLabel: timeLabel, and: timerSlider)
    }
    
    private func deactivateStatus(for label: UILabel, numberLabel: UILabel, and slider: UISlider) {
        label.alpha = 0.5
        numberLabel.alpha = 0.5
        numberLabel.text = label.text == "Timer" ? "1 min" : "1"
        slider.alpha = 0.5
        slider.value = 1
    }
    
    private func activateStatus(for label: UILabel, numberLabel: UILabel, and slider: UISlider) {
        label.alpha = 1.0
        numberLabel.alpha = 1.0
        slider.alpha = 1.0
    }
    
}


//MARK: - Setup constraints
extension RepsOrTimerView {
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            setsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            setsSlider.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 5),
            setsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            setsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            chooseLabel.topAnchor.constraint(equalTo: setsSlider.bottomAnchor, constant: 10),
            chooseLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            repsStackView.topAnchor.constraint(equalTo: chooseLabel.bottomAnchor, constant: 25),
            repsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            repsSlider.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 5),
            repsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            timerStackView.topAnchor.constraint(equalTo: repsSlider.bottomAnchor, constant: 25),
            timerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            timerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            timerSlider.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: 5),
            timerSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            timerSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
    
}
