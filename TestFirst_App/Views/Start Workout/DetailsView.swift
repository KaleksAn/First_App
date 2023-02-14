//
//  DetailsView.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 04/02/23.
//

import UIKit

protocol NextSetProtocol: AnyObject {
    func nextSetTapped()
}

class DetailsView: UIView {
    
    let nameLabel: UILabel = {
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
    
     let numbersSets: UILabel = {
       let label = UILabel()
        label.text = "1/4"
        label.textColor = .specialGray
         label.textAlignment = .right
        label.font = .robotMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let setsUnderLine: UIView = {
       let view = UIView()
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let reps: UILabel = {
       let label = UILabel()
        label.text = "Reps"
        label.textColor = .specialGray
        label.font = .robotMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numbersReps: UILabel = {
       let label = UILabel()
        label.text = "20"
        label.textColor = .specialGray
        label.font = .robotMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsUnderLine: UIView = {
       let view = UIView()
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var editingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "editing")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle("Editing", for: .normal)
        button.tintColor = .specialLightBrown
        button.titleLabel?.font = .robotBold16()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var nextSetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT SET", for: .normal)
        button.titleLabel?.font = .robotMedium18()
        button.tintColor = .specialGray
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nextSetsButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private var setsStackView = UIStackView()
    private var repsStackView = UIStackView()
    
    weak var cellNextSetDelegate: NextSetProtocol?

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
        addSubview(nameLabel)
        
        setsStackView = UIStackView(arrangedSubviews: [setsLabel, numbersSets], axis: .horizontal, spacing: 10)
        setsStackView.contentMode = .scaleAspectFill
        addSubview(setsStackView)
        addSubview(setsUnderLine)
        
        repsStackView = UIStackView(arrangedSubviews: [reps, numbersReps], axis: .horizontal, spacing: 10)
        addSubview(repsStackView)
        addSubview(repsUnderLine)
        addSubview(editingButton)
        addSubview(nextSetButton)
        
    }
    
    @objc
    private func nextSetsButton() {
        cellNextSetDelegate?.nextSetTapped()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            setsStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            setsStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            setsUnderLine.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 2),
            setsUnderLine.leadingAnchor.constraint(equalTo: setsStackView.leadingAnchor),
            setsUnderLine.trailingAnchor.constraint(equalTo: setsStackView.trailingAnchor),
            setsUnderLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            repsStackView.topAnchor.constraint(equalTo: setsUnderLine.bottomAnchor, constant: 30),
            repsStackView.leadingAnchor.constraint(equalTo: setsUnderLine.leadingAnchor),
            repsStackView.trailingAnchor.constraint(equalTo: setsUnderLine.trailingAnchor),
            repsStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            repsUnderLine.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 2),
            repsUnderLine.leadingAnchor.constraint(equalTo: repsStackView.leadingAnchor),
            repsUnderLine.trailingAnchor.constraint(equalTo: repsStackView.trailingAnchor),
            repsUnderLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            editingButton.topAnchor.constraint(equalTo: repsUnderLine.bottomAnchor, constant: 5),
            editingButton.trailingAnchor.constraint(equalTo: repsUnderLine.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nextSetButton.topAnchor.constraint(equalTo: editingButton.bottomAnchor, constant: 10),
            nextSetButton.leadingAnchor.constraint(equalTo: repsUnderLine.leadingAnchor),
            nextSetButton.trailingAnchor.constraint(equalTo: repsUnderLine.trailingAnchor),
            nextSetButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
}
