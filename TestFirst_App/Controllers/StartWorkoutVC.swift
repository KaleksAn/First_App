//
//  StartWorkout.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 04/02/23.
//

import UIKit

class StartWorkoutVC: UIViewController {
    
    private let startWorkoutLabel: UILabel = {
       let label = UILabel()
        label.text = "START WORKOUT"
        label.textAlignment = .center
        label.textColor = .specialGray
        label.font = .robotMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let image = UIImage(named: "closeButton")?.withRenderingMode(.alwaysOriginal)
        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let imageWorkout: UIImageView = {
        let image = UIImage(named: "readyWorkout")
       let imageView = UIImageView()
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var finishButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("FINISH", for: .normal)
        button.titleLabel?.tintColor = .white
        button.titleLabel?.font = .robotBold16()
        button.backgroundColor = .specialGreen
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let detailsLabel = UILabel(text: "Details")
    private let detailView = DetailsView()
    
    var workoutModel = WorkoutModel()
    private var numberOfSet = 1
    
    override func viewDidLayoutSubviews() {
        closeButton.layer.cornerRadius = closeButton.frame.width / 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        setWorkoutParametrs()
        setDelegates()
    }
    
    private func setDelegates() {
        detailView.cellNextSetDelegate = self
    }

    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(imageWorkout)
        view.addSubview(detailsLabel)
        view.addSubview(detailView)
        view.addSubview(finishButton)
    }
    
    private func setWorkoutParametrs() {
        detailView.nameLabel.text = workoutModel.workoutName
        detailView.numbersSets.text = "\(numberOfSet)/\(workoutModel.workoutSets)"
        detailView.numbersReps.text = "\(workoutModel.workoutReps)"
    }
    
    @objc
    private func tappedCloseButton() {
        dismiss(animated: true)
    }
    
    @objc
    private func finishButtonTapped() {
        if numberOfSet == workoutModel.workoutSets {
            dismiss(animated: true)
            RealmManager.shared.updateWorkoutModel(model: workoutModel, bool: true)
        } else {
            alertOkCancel(title: "worning", message: "You haven't finished your workout") { [weak self] in
                self?.dismiss(animated: true)
            }
        }
    }
    

}

//MARK: - NextSetProtocol
extension StartWorkoutVC: NextSetProtocol {
    func nextSetTapped() {
        if numberOfSet < workoutModel.workoutSets {
            numberOfSet += 1
            detailView.numbersSets.text = "\(numberOfSet)/\(workoutModel.workoutSets)"
        } else {
            alertOk(title: "Error", message: "Finish your workout")
        }
    }
}

//MARK: - Set constraints
extension StartWorkoutVC {
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
            closeButton.leadingAnchor.constraint(equalTo: startWorkoutLabel.trailingAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            imageWorkout.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 25),
            imageWorkout.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageWorkout.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            imageWorkout.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: imageWorkout.bottomAnchor, constant: 10),
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 5),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            detailView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            finishButton.topAnchor.constraint(equalTo: detailView.bottomAnchor, constant: 20),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            finishButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 7)
        ])

    }
    
}
