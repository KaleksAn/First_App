//
//  WorkoutTableViewCell.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 26/01/23.
//

import UIKit

protocol StartworkoutProtocol: AnyObject {
    func startButtonTapped(model: WorkoutModel)
}

class WorkoutTableViewCell: UITableViewCell {
    
    private let backgroundWorkoutView: UIView = {
       let view = UIView()
        view.backgroundColor = .specialBrown
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backgroundImageView: UIView = {
       let view = UIView()
        view.backgroundColor = .specialBackground
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let workoutImageView: UIImageView = {
       let imageView = UIImageView()
//        imageView.image = UIImage(named: "imageCell")
//        imageView.backgroundColor = .specialBackground
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let workoutNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Pull Ups"
        label.font = .robotBold20()
        label.textColor = .specialBlack
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsLabel: UILabel = {
       let label = UILabel()
        label.text = "Reps: 20"
        label.font = .robotMedium14()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let setsLabel: UILabel = {
        let label = UILabel()
         label.text = "Sets: 4"
         label.font = .robotMedium14()
         label.textColor = .specialBlack
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
       // button.setTitle("START", for: .normal)
        //button.setTitleColor(.specialDarkGreen, for: .normal)
        //button.backgroundColor = .specialYellow
        button.titleLabel?.font = .robotMedium18()
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.tintColor = .specialGray
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var labelsStackView = UIStackView()
    
    var workoutModel = WorkoutModel()
    
    weak var cellStartWorkoutDelegate: StartworkoutProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        selectionStyle = .none
        backgroundColor = .clear
        addSubview(backgroundWorkoutView)
        addSubview(backgroundImageView)
        addSubview(workoutImageView)
        addSubview(workoutNameLabel)
        labelsStackView = UIStackView(arrangedSubviews: [repsLabel, setsLabel],
                                axis: .horizontal, spacing: 5)
        addSubview(labelsStackView)
        contentView.addSubview(startButton)
    }
    
    func cellConfigure(model: WorkoutModel) {
        workoutModel = model
        workoutNameLabel.text = model.workoutName
        
        let (min, sec) = { return ($0 / 60, $0 % 60) }(model.workoutTimer)
        repsLabel.text = (model.workoutTimer == 0 ? "Reps: \(model.workoutReps)" : "Timer: \(min) \(sec)")
        setsLabel.text = "Sets: \(model.workoutSets)"
        
        guard let imageData = model.workoutImage else { return }
        guard let image = UIImage(data: imageData) else { return }
        workoutImageView.image = image
        
        if model.workoutStatus {
            startButton.setTitle("COMPLETE", for: .normal)
            startButton.tintColor = .white
            startButton.backgroundColor = .specialGreen
            startButton.isEnabled = false
        } else {
            startButton.setTitle("START", for: .normal)
            startButton.tintColor = .specialDarkGreen
            startButton.backgroundColor = .specialYellow
            startButton.isEnabled = true
        }
    }
    
    @objc
    private func startButtonTapped() {
        cellStartWorkoutDelegate?.startButtonTapped(model: workoutModel)
    }
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            backgroundWorkoutView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundWorkoutView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            backgroundWorkoutView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backgroundWorkoutView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            backgroundImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backgroundImageView.widthAnchor.constraint(equalToConstant: 80.0),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 80.0)
        ])
        
        NSLayoutConstraint.activate([
            workoutImageView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 5),
            workoutImageView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -5),
            workoutImageView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 5),
            workoutImageView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            workoutNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            workoutNameLabel.leadingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 5),
            labelsStackView.leadingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: 10),
            labelsStackView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 5),
            startButton.leadingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: 5),
            startButton.trailingAnchor.constraint(equalTo: backgroundWorkoutView.trailingAnchor, constant: -5),
            startButton.bottomAnchor.constraint(equalTo: backgroundWorkoutView.bottomAnchor, constant: -5)
        ])
        
    }
    
}
