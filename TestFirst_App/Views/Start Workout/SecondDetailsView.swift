//
//  SecondDetailsView.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 19/02/23.
//

import UIKit

class SecondDetailsView: UIView {
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Squats"
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
    
    let numberSets: UILabel = {
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
    
    private let timeOfSet: UILabel = {
       let label = UILabel()
        label.text = "Time of Set"
        label.textColor = .specialGray
        label.font = .robotMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeLabel: UILabel = {
       let label = UILabel()
        label.text = "1 min 30 sec"
        label.textColor = .specialGray
        label.font = .robotMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timerUnderLine: UIView = {
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
        //button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var firstStackView = UIStackView()
    private var secondStackView = UIStackView()

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
        
        addSubview(nameLabel)
        firstStackView = UIStackView(arrangedSubviews: [setsLabel, numberSets], axis: .horizontal, spacing: 10)
        firstStackView.contentMode = .scaleAspectFill
        addSubview(firstStackView)
        addSubview(setsUnderLine)
        
        secondStackView = UIStackView(arrangedSubviews: [timeOfSet, timeLabel], axis: .horizontal, spacing: 10)
        secondStackView.contentMode = .scaleAspectFill
        addSubview(secondStackView)
        addSubview(timerUnderLine)
        addSubview(editingButton)
        addSubview(nextSetButton)
    }
    
    private func setupConstraints() {
        
    }

}
