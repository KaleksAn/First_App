//
//  RealmManager.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 02/02/23.
//

import Foundation
import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    
    private init() { }
    
    private let localRealm = try! Realm()
    
    func saveWorkoutModel(model: WorkoutModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func updateWorkoutModel(model: WorkoutModel, bool: Bool) {
        try! localRealm.write {
            model.workoutStatus = bool
        }
    }
    
    func deleteWorkoutModel(model: WorkoutModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
    
}
