//
//  MenuButtonView.swift
//  RelativePitch
//
//  Created by Chen Wang on 1/20/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit

class MenuButtonView: UIView {
    
    var button:UIButton!
    var shadow:UIView!
    var label:CommonLabel!


    override init(frame: CGRect) {
        super.init(frame: frame)
        //my modification
        
        self.isUserInteractionEnabled = true
        
        
        //for button
        button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 0, y: 0, width: frame.size.width-7, height: frame.size.height-7)
        button.backgroundColor = .white
        //button.layer.cornerRadius = 25
        button.setRoundedCorners(ratio: nil)
        //button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        button.addTarget(self, action: #selector(buttonLifted), for: .touchUpInside)
        
        
        
        
        
        //for shadow
        shadow = UIView()
        shadow.frame = CGRect(x: 7 , y: 7, width: frame.size.width-7, height: frame.size.height-7)
        shadow.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        shadow.setRoundedCorners(ratio: nil)
        shadow.clipsToBounds = true
        
        
        
        //for label
        label = CommonLabel(frame: button.frame)
        label.text = "Resume"
    
      

        
        
        //add up
        self.addSubview(shadow)
        self.addSubview(button)
        button.addSubview(label)
        
        
       
        
    }

    
    
    @objc func buttonLifted(){
        UIView.animate(withDuration: 0.3) {
            self.shadow.frame = CGRect(x: 7, y: 7, width: self.frame.size.width-7, height: self.frame.size.height-7)
            self.button.frame = CGRect(x: 0, y: 0, width: self.frame.size.width-7, height: self.frame.size.height-7)
        }
    }
    
    
    
    
    @objc func buttonPressed(){
        UIView.animate(withDuration: 0.3) {
            self.shadow.frame = CGRect(x: 3, y: 3, width: self.frame.size.width-7, height: self.frame.size.height-7)
            self.button.frame = CGRect(x: 3, y: 3, width: self.frame.size.width-7, height: self.frame.size.height-7)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
