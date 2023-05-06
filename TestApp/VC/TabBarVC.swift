//
//  TabBarVC.swift
//  TestApp
//
//  Created by Дмитрий Лоренц on 06.05.2023.
//

import UIKit

class TabBarVC: UITabBarController {
    
    fileprivate func setTabBar() {

        view.backgroundColor = .white
        let homeVC = UINavigationController(rootViewController: HomeController() )
        let homeItem = UITabBarItem(title: nil, image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIconActive")?.withRenderingMode(.alwaysOriginal))
        homeVC.tabBarItem = homeItem
        
        let hurtVC = UIViewController()
        hurtVC.view.backgroundColor = .lightGray
        let hurtItem = UITabBarItem(title: nil, image: UIImage(named: "hurtIcon"), selectedImage: UIImage(named: "hurtIcon")?.withRenderingMode(.alwaysOriginal))
        hurtVC.tabBarItem = hurtItem
        
        let cartVC = UIViewController()
        cartVC.view.backgroundColor = .lightText
        let cartItem = UITabBarItem(title: nil, image: UIImage(named: "cartIcon"), selectedImage: UIImage(named: "cartIcon")?.withRenderingMode(.alwaysOriginal))
        cartVC.tabBarItem = cartItem
        
        let noticetVC = UIViewController()
        noticetVC.view.backgroundColor = .systemGray6
        let noticeItem = UITabBarItem(title: nil, image: UIImage(named: "noticeIcon"), selectedImage: UIImage(named: "noticeIcon")?.withRenderingMode(.alwaysOriginal))
        noticetVC.tabBarItem = noticeItem
        
        let personVC = UIViewController()
        personVC.view.backgroundColor = .systemBackground
        let personItem = UITabBarItem(title: nil, image: UIImage(named: "personIcon"), selectedImage: UIImage(named: "personIconActive")?.withRenderingMode(.alwaysOriginal))
        personVC.tabBarItem = personItem
        
        setViewControllers([homeVC, hurtVC, cartVC,noticetVC,personVC], animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()

        
    }
    

   

}
