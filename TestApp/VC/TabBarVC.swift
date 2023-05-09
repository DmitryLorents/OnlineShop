//
//  TabBarVC.swift
//  TestApp
//
//  Created by Дмитрий Лоренц on 06.05.2023.
//

import UIKit

class TabBarVC: UITabBarController {
    
    fileprivate func setTabBar() {
        
        tabBar.backgroundColor = .white
        tabBar.alpha = 1
        let homeVC = UINavigationController(rootViewController: HomeController() )
        let homeItem = UITabBarItem(title: nil, image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIconActive")?.withRenderingMode(.alwaysOriginal))
        let standartInset: CGFloat = 12
        homeItem.imageInsets = UIEdgeInsets(top: standartInset, left: 0, bottom: -standartInset, right: 0)
        homeVC.tabBarItem = homeItem
        
        let hurtVC = UIViewController()
        hurtVC.view.backgroundColor = .lightGray
        let hurtItem = UITabBarItem(title: nil, image: UIImage(named: "hurtIcon"), selectedImage: UIImage(named: "hurtIcon")?.withRenderingMode(.alwaysOriginal))
        hurtItem.imageInsets = UIEdgeInsets(top: standartInset, left: 0, bottom: -standartInset, right: 0)
        hurtVC.tabBarItem = hurtItem
        
        let cartVC = UIViewController()
        cartVC.view.backgroundColor = .lightText
        let cartItem = UITabBarItem(title: nil, image: UIImage(named: "cartIcon"), selectedImage: UIImage(named: "cartIcon")?.withRenderingMode(.alwaysOriginal))
        cartItem.imageInsets = UIEdgeInsets(top: standartInset, left: 0, bottom: -standartInset, right: 0)
        cartVC.tabBarItem = cartItem
        
        let noticetVC = UIViewController()
        noticetVC.view.backgroundColor = .systemGray6
        let noticeItem = UITabBarItem(title: nil, image: UIImage(named: "noticeIcon"), selectedImage: UIImage(named: "noticeIcon")?.withRenderingMode(.alwaysOriginal))
        noticeItem.imageInsets = UIEdgeInsets(top: standartInset, left: 0, bottom: -standartInset, right: 0)
        noticetVC.tabBarItem = noticeItem
        
        let personVC = UIViewController()
        personVC.view.backgroundColor = .systemBackground
        let personItem = UITabBarItem(title: nil, image: UIImage(named: "personIcon"), selectedImage: UIImage(named: "personIconActive")?.withRenderingMode(.alwaysOriginal))
        personItem.imageInsets = UIEdgeInsets(top: standartInset, left: 0, bottom: -standartInset, right: 0)
        personVC.tabBarItem = personItem
        
        setViewControllers([homeVC, hurtVC, cartVC,noticetVC,personVC], animated: true)
        tabBar.layer.cornerRadius = 25
        tabBar.layer.masksToBounds = true
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        
        
    }
    
    
    
    
}
