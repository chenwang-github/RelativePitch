//
//  tabbarController.swift
//  RelativePitch
//
//  Created by Chen Wang on 2/25/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addChilds()
    }

    private func addChilds(){
        let vc1 = MainViewController()
        let nvc1 = UINavigationController(rootViewController: vc1)
        nvc1.navigationBar.isHidden = true
        self.view.backgroundColor = UIColor.orange
        nvc1.title = "1"
        nvc1.tabBarItem.image = UIImage(named: "Image1")
        //nvc1.tabBarItem.badgeValue = "!"

        
        let vc2 = SongListController()
        let nvc2 = UINavigationController(rootViewController: vc2)
        nvc2.navigationBar.isHidden = true
        nvc2.title = "1"
        nvc2.tabBarItem.image = UIImage(named: "Image1")
        //nvc2.tabBarItem.badgeValue = "!"
        
        
        self.viewControllers = [nvc1, nvc2]
    }
}
