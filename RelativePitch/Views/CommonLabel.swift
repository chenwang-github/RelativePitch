//
//  CommonLabel.swift
//  RelativePitch
//
//  Created by Chen Wang on 1/21/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit

class CommonLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame:frame)
        //my modification
        self.backgroundColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 0)
        self.textColor = customRed
        self.font = UIFont(name: "PingFangSC-Light", size: 24)
        self.textAlignment = .center
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
