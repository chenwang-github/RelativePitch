//
//  tabbarController.swift
//  RelativePitch
//
//  Created by Chen Wang on 2/25/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit

class tabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.addChild(MainViewController())
        self.addChild()
    }
    


}
