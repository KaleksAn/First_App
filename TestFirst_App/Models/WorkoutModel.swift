//
//  WorkoutModel.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 02/02/23.
//

import Foundation
import RealmSwift

class WorkoutModel: Object {
    @Persisted var workoutDate: Date
    @Persisted var workoutNumberOfDay: Int = 0
    @Persisted var workoutName: String = "Unknow"
    @Persisted var workoutRepeat: Bool = true
    @Persisted var workoutSets: Int = 0
    @Persisted var workoutTimer: Int = 0
    @Persisted var workoutImage: Data?
}
