//
//  SongCell.swift
//  RelativePitch
//
//  Created by Chen Wang on 2/26/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit
import SnapKit

class SongCell: UITableViewCell {

    var button: UIButton!
    var leftLabel:CommonLabel!
    var rightImage:UIImageView!


    public func customSetUp(name:String,lock:Bool){
        self.backgroundColor = customRed
        self.selectionStyle = .none
        addButton()
        addImageView(lock: lock)
        addLeftLabel(name: name)
        useSnapKit()
    }
    
    
    // MARK: add Subviews
    private func addButton(){
        button = UIButton(type: .roundedRect)
        button.backgroundColor = .white
        //button.layer.cornerRadius = 25
        //button.clipsToBounds = true
        button.isEnabled = false
        button.layer.cornerRadius = 10
        
        button.layer.shadowOpacity = 1 //阴影区域透明度
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor // 阴影区域颜色
        button.layer.shadowOffset = CGSize(width: 3, height: 3) //阴影区域范围
        button.layer.shadowRadius = 0
        
        self.addSubview(button)
    }
    
    private func addLeftLabel(name:String){
        leftLabel = CommonLabel()
        leftLabel.text = name
        leftLabel.font  = UIFont(name: "PingFangSC-Light", size: 20)
        leftLabel.textAlignment = .left
        self.addSubview(leftLabel)
        
    }
    
    
    private func addImageView(lock:Bool){
        rightImage = UIImageView()
        rightImage.backgroundColor = customRed
        if lock{
            rightImage?.image = UIImage(named: "lock")
        }else{
            rightImage?.image = UIImage(named: "unlock")
            rightImage.backgroundColor = UIColor.black
        }
        self.addSubview(rightImage)
    }
    
    // MARK: add constraint
    private func useSnapKit(){
        button.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-5)
            make.height.equalTo(screenHeight/15)
        }
        
        leftLabel.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(30)
            make.right.equalTo(-10)
            make.bottom.equalTo(-5)
            make.height.equalTo(screenHeight/15)
        }
        
        rightImage.snp.makeConstraints { (make) in
            //make.left.equalTo(30)
            make.right.equalTo(-30)
            make.centerY.equalTo(snp_centerYWithinMargins)
            make.size.equalTo(CGSize(width: screenHeight/19, height: screenHeight/19))
        }
    }
}

    
    
    
    

