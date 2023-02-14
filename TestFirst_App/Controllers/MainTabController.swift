//
//  MainTabController.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 31/01/23.
//

import UIKit

@available(iOS 15.0, *)
class MainTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBar()
        setupItems()
    }
    

    private func setupBar() {
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .specialDarkGreen
        tabBar.unselectedItemTintColor = .specialGray
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.specialLightBrown.cgColor
    }
    
    private func setupItems() {
        let mainVC = MainViewController()
        let statisticVC = StatisticViewController()
        let profileVC = ProfileViewController()
        
        //let startWorkoutVC = StartWorkout() // Test VC
        
        setViewControllers([mainVC, statisticVC, profileVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Main"
        items[1].title = "Statistic"
        items[2].title = "Profile"
        
        items[0].image = UIImage(named: "tabBarMain")
        items[1].image = UIImage(named: "tabBarProfile")
        items[2].image = UIImage(named: "tabBarStatistic")
    }

}
