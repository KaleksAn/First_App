//
//  NewWorkoutVC.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 30/01/23.
//

import UIKit
import RealmSwift

class NewWorkoutVC: UIViewController {
    weak var customDelegate: ReloadTableViewDelegate?
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "closeButton")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(closeNewWorkoutVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let labelWorkoutVC: UILabel = {
       let label = UILabel()
        label.text = "NEW WORKOUT"
        label.font = .robotMedium24()
        label.textColor = .specialBlack
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelForTextField = UILabel(text: "Name")
    private let dateAndRepeatLabel = UILabel(text: "Date and Repeat")
    private let repsOrTimerLabel = UILabel(text: "Reps or timer")
    
    private let nameTextField: UITextField = {
       let field = UITextField()
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: field.frame.size.height))
        field.leftViewMode = .always
        field.layer.cornerRadius = 10
        field.textColor = .specialGray
        field.font = .robotBold20()
        field.clearButtonMode = .always
        field.returnKeyType = .done
        field.backgroundColor = .specialBrown
        field.placeholder = "Enter workout name"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SAVE", for: .normal)
        button.titleLabel?.font = .robotBold16()
        button.backgroundColor = .specialGreen
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveButtonTaped), for: .touchUpInside)
        return button
    }()
    
    
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsOrTimerView = RepsOrTimerView()
    
    private let localRealm = try! Realm() // Create BD
    private var workoutModel = WorkoutModel() // Create object for BD
    
    private let testImage = UIImage(named: "imageCell")

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        setDelegates()
    }
    
    override func viewDidLayoutSubviews() {
        closeButton.layer.cornerRadius = closeButton.frame.width / 2
    }

    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(closeButton)
        view.addSubview(labelWorkoutVC)
        view.addSubview(labelForTextField)
        view.addSubview(nameTextField)
        view.addSubview(dateAndRepeatLabel)
        view.addSubview(dateAndRepeatView)
        view.addSubview(repsOrTimerLabel)
        view.addSubview(repsOrTimerView)
        view.addSubview(saveButton)
        
        hideKeyboardWhenTappedAround()
    }
    
    private func setDelegates() {
        nameTextField.delegate = self
    }
    
    private func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    
    //MARK: - Selectors
    @objc
    func saveButtonTaped() {
       // RealmManager.shared.saveWorkoutModel(model: workoutModel)
        setModel()
        saveModel()
    }
    
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc
    private func closeNewWorkoutVC() {
        customDelegate?.reloadTableViewForModalCV(self)
        dismiss(animated: true)
    }
    
    //MARK: - Create model for Realm
    //Create model
    private func setModel() {
        guard let nameWorkout = nameTextField.text else { return }
        workoutModel.workoutName = nameWorkout
        
        workoutModel.workoutDate = dateAndRepeatView.datePicker.date
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday], from: dateAndRepeatView.datePicker.date)
        guard let weekDay = components.weekday else { return }
        workoutModel.workoutNumberOfDay = weekDay
        
        workoutModel.workoutRepeat = dateAndRepeatView.repSwitch.isOn
        workoutModel.workoutSets = Int(repsOrTimerView.setsSlider.value)
        workoutModel.workoutReps = Int(repsOrTimerView.repsSlider.value)
        workoutModel.workoutTimer = Int(repsOrTimerView.timerSlider.value)
        
        guard let imageData = testImage?.pngData() else { return }
        workoutModel.workoutImage = imageData
        
        
    }
    
    private func saveModel() {
        guard let text = nameTextField.text else { return }
        let count = text.filter{ $0.isNumber || $0.isLetter }.count

        if count != 0 && workoutModel.workoutSets != 0 && (workoutModel.workoutReps != 0 || workoutModel.workoutTimer != 0) {
            RealmManager.shared.saveWorkoutModel(model: workoutModel)
            alertOk(title: "Success", message: nil)
            workoutModel = WorkoutModel()
            refreshWorkoutObjects()
        } else {
            alertOk(title: "Error", message: "Enter all parameters")
        }
    }
    
    private func refreshWorkoutObjects() {
        dateAndRepeatView.datePicker.setDate(Date(), animated: true)
        nameTextField.text = ""
        dateAndRepeatView.repSwitch.isOn = true
        repsOrTimerView.numberSetslabel.text = "0"
        repsOrTimerView.setsSlider.value = 0
        repsOrTimerView.numberRepslabel.text = "0"
        repsOrTimerView.repsSlider.value = 0
        repsOrTimerView.numberOfTimerLabel.text = "0"
        repsOrTimerView.timerSlider.value = 0
    }
    
}


//MARK: - Set constraints

extension NewWorkoutVC {
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            labelWorkoutVC.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            labelWorkoutVC.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelForTextField.topAnchor.constraint(equalTo: labelWorkoutVC.bottomAnchor, constant: 5),
            labelForTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelForTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: labelForTextField.bottomAnchor, constant: 5),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            nameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            dateAndRepeatLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            dateAndRepeatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateAndRepeatLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            dateAndRepeatView.topAnchor.constraint(equalTo: dateAndRepeatLabel.bottomAnchor, constant: 5),
            dateAndRepeatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateAndRepeatView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateAndRepeatView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            repsOrTimerLabel.topAnchor.constraint(equalTo: dateAndRepeatView.bottomAnchor, constant: 20),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            repsOrTimerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            repsOrTimerView.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 5),
            repsOrTimerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            repsOrTimerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 320)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: repsOrTimerView.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
}

extension NewWorkoutVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return nameTextField.resignFirstResponder()
    }
    
}

//MARK: - NewWorkoutVCDelegates
protocol ReloadTableViewDelegate: AnyObject {
    func reloadTableViewForModalCV(_ viewController: NewWorkoutVC)
}
