//
//  DateAndRepeatView.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 30/01/23.
//

import UIKit

class DateAndRepeatView: UIView {
    
    private let dateLabel: UILabel = {
       let label = UILabel()
        label.text = "Date"
        label.textColor = .specialGray
        label.font = .robotMedium18()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private let repeatLabel: UILabel = {
       let label = UILabel()
        label.text = "Repeat every 7 days"
        label.textColor = .specialGray
        label.font = .robotMedium18()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repSwitch: UISwitch = {
        let sw = UISwitch()
        sw.isOn = true
        sw.onTintColor = .specialGreen
        sw.translatesAutoresizingMaskIntoConstraints = false
        return sw
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    private var dateStackView = UIStackView()
    private var repeatStackView = UIStackView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Setup Views
    private func setupViews() {
        backgroundColor = .specialBrown
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        
        dateStackView = UIStackView(arrangedSubviews: [dateLabel, datePicker], axis: .horizontal, spacing: 10)
        addSubview(dateStackView)
        repeatStackView = UIStackView(arrangedSubviews: [repeatLabel, repSwitch], axis: .horizontal, spacing: 10)
        addSubview(repeatStackView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            dateStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            dateStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dateStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            repeatStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 10),
            repeatStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            repeatStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
    }
}
