//
//  ShadowButton.swift
//  RelativePitch
//
//  Created by Chen Wang on 2/26/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit

class ShadowButton: UIButton {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUp(){
        self.backgroundColor = UIColor.white
        self.isEnabled = false
        self.layer.cornerRadius = 25

        self.layer.shadowOpacity = 1 //阴影区域透明度
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor // 阴影区域颜色
        self.layer.shadowOffset = CGSize(width: 3, height: 3) //阴影区域范围
        self.layer.shadowRadius = 25
    }
    
    
}
