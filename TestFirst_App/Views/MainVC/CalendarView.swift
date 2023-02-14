//
//  CalendarView.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 12/01/23.
//

import UIKit

protocol SelectCollectionViewProtocol: AnyObject {
    func selectItem(date: Date)
}

class CalendarView: UIView {
    
    //Create collectionView
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        return collectionView
    }()
    
    private let idCalendarCell = "idCalendarCell"
    
    weak var cellCollectionViewDelegate: SelectCollectionViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
        setDelegates()
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: idCalendarCell)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func getDate() -> [[String]] {
        var arrayComponents: [[String]] = [[], []]
        let myCalendar = Calendar.current
        let myDate = Date()
        let myFormat = DateFormatter()
        myFormat.locale = Locale(identifier: "en-US")
        myFormat.dateFormat = "EEEEEEE"
        
        for i in -6...0 {
            let computedDate = myCalendar.date(byAdding: .day, value: i, to: myDate)
            guard let date = computedDate else { return [[]] }
            let nameDay = myFormat.string(from: date)
            arrayComponents[0].append(nameDay)
            let numberDay = myCalendar.dateComponents([.day], from: date).day ?? 0
            arrayComponents[1].append("\(numberDay)")
        }
        return arrayComponents
    }
    
}

//MARK: - UICollectionViewDataSource

extension CalendarView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCalendarCell, for: indexPath) as! CalendarCollectionViewCell
        cell.setupDate(from: getDate(), at: indexPath)
        if indexPath.item == 6 {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .right)
        }
        return cell
    }
    
}

//MARK: - UICollectionViewDelegate

extension CalendarView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let components = calendar.dateComponents([ .month, .year], from: Date())
        guard let month = components.month else { return }
        guard let year = components.year else { return }
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? CalendarCollectionViewCell else { return }
        guard let numberOfDayString = cell.numberOfDayLabel.text else { return }
        guard let numberOfDay = Int(numberOfDayString) else { return }
        
        guard let date = formatter.date(from: "\(year)/\(month)/\(numberOfDay) 00:00") else { return }

        cellCollectionViewDelegate?.selectItem(date: date)
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout

extension CalendarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 34,
               height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
}



//MARK: - Set constraints

extension CalendarView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 105),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
        
    }
    
    
}
