//
//  MainTabBarViewController.swift
//  BetterLife2
//
//  Created by Timur Karimov on 12.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//


import UIKit

public class MainTabBarViewController: UITabBarController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let scale = UIScreen.main.scale
        
        let mainScreenVC = MainScreenAssembler().assemble()
        let mainScreenNavigator = UINavigationController()
        mainScreenNavigator.viewControllers = [mainScreenVC]
        mainScreenNavigator.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 7)
        
        let placeToVisitVC = PlaceToVisitListAssembler().asseble()
        let placeNavigator = UINavigationController()
        placeNavigator.viewControllers = [placeToVisitVC]
        placeNavigator.tabBarItem = UITabBarItem(title: "Места", image: UIImage(named: "icons8-city"), tag: 0)
        
        let peopleToRememberVC = PeopleToRememberAssembler().assemble()
        let peopleNavigator = UINavigationController()
        peopleNavigator.viewControllers = [peopleToRememberVC]
        peopleNavigator.tabBarItem = UITabBarItem(title: "Люди", image: UIImage(named: "icons8-contacts"), tag: 1)
        
        
        let QLListVC = QLListAssembler().assemble()
        let QLNavigator = UINavigationController()
        QLNavigator.viewControllers = [QLListVC]
        QLNavigator.tabBarItem = UITabBarItem(title: "Критерии", image: UIImage(named: "icons8-seed_of_life"), tag: 2)
        
        
        let SWOTVC = SWOTCreateAssembler().assemble()
        let SWOTNavigator = UINavigationController()
        SWOTNavigator.viewControllers = [SWOTVC]
        SWOTNavigator.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 3)
        
        
        let targetsListVC = TargetsListAssembler().assembler(dateItem: DateItem(type: .years, value: ""))
        let targetsNavigator = UINavigationController()
        targetsNavigator.viewControllers = [targetsListVC]
        targetsNavigator.tabBarItem = UITabBarItem(title: "Цели", image: UIImage(named: "icons8-2020"), tag: 4)
        
       // let item = DateItem(type: .week, value: "", date: Date(year: 2020, mounth: 4, day: 5))
        let targetsListVC2 = WeeksListAssembler().assemble()
        let targetsNavigator2 = UINavigationController()
        targetsNavigator2.viewControllers = [targetsListVC2]
        targetsNavigator2.tabBarItem = UITabBarItem(title: "Недели", image: UIImage(named: "icons8-wednesday"), tag: 5)
        
        
        let factorsVC = FactorsListAssembler().assemble()
        let factorsNavigator = UINavigationController()
        factorsNavigator.viewControllers = [factorsVC]
        factorsNavigator.tabBarItem = UITabBarItem(title: "Факторы", image: UIImage(named: "icons8-facebook_like"), tag: 6)
        
        
        let weeksTotalVC = WeeksTotalAssembler().assemble()
        let weeksTotalNavigator = UINavigationController()
        weeksTotalNavigator.viewControllers = [weeksTotalVC]
        weeksTotalNavigator.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 7)
        
        
        let weeksStatisticsVC = WeeksStatisticsAssmembler().assemble()
        let weeksStatisticsNav = UINavigationController()
        weeksStatisticsNav.viewControllers = [weeksStatisticsVC]
        weeksStatisticsNav.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 8)
        
        
        let SWOTListVC = SWOTListAssembler().assemble()
        SWOTListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 9)
        
        
        self.viewControllers = [mainScreenNavigator, QLNavigator, factorsNavigator, targetsNavigator, targetsNavigator2, placeNavigator, peopleNavigator, SWOTNavigator, weeksTotalNavigator, weeksStatisticsNav, SWOTListVC]
    }
}
