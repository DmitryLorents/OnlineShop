//
//  TabBarVC.swift
//  TestApp
//
//  Created by Дмитрий Лоренц on 06.05.2023.
//

import UIKit

class TabBarVC: UITabBarController {
    
    fileprivate func setTabBar() {

        let homeVC = HomeController()
        let homeItem = UITabBarItem(title: nil, image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIconActive")?.withRenderingMode(.alwaysOriginal))
        homeVC.tabBarItem = homeItem
        setViewControllers([homeVC], animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()

        
    }
    

   

}
