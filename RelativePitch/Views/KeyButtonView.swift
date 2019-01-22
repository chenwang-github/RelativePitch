//
//  KeyButtonView.swift
//  RelativePitch
//
//  Created by Chen Wang on 1/20/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit

class KeyButtonView: UIView {

    var button:UIButton!
    var shadow:UIView!
    var frontShadow:UIView!
    var label:CommonLabel!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        //my modification
        
        self.clipsToBounds = true
        
        button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.width-5, height: frame.height-5))
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        button.addTarget(self, action: #selector(buttonLifted), for: .touchUpInside)
        
        shadow = UIView(frame: CGRect(x: 5, y: 5, width: frame.width, height: frame.height))
        shadow.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        shadow.layer.cornerRadius = 25
        shadow.clipsToBounds = true
        
        frontShadow = UIView(frame: CGRect(x: -(frame.width-5), y: 0, width: frame.width-5, height: frame.height-5))
        frontShadow.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        frontShadow.layer.cornerRadius = 25
        frontShadow.clipsToBounds = true
        
        self.addSubview(shadow)
        self.addSubview(button)
        self.addSubview(frontShadow)
        
        
        //setup Label
        label = CommonLabel(frame: CGRect(x: 0, y: 0, width: frame.size.width-5, height: frame.size.width+10))
        label.text = "A"
        self.addSubview(label)
        
        
    }
    
    
    @objc func buttonPressed(){
        UIView.animate(withDuration: 0.2) {
            self.button.frame.origin.x = self.button.frame.origin.x+3
            self.button.frame.origin.y = self.button.frame.origin.y+3
            
            self.shadow.frame.origin.x = self.shadow.frame.origin.x-3
            self.shadow.frame.origin.y = self.shadow.frame.origin.y+3
            
            self.frontShadow.frame.origin.x = self.frontShadow.frame.origin.x + 10
            self.frontShadow.frame.origin.y = self.frontShadow.frame.origin.y + 10
            
            self.label.frame.origin.x = self.label.frame.origin.x+3
            self.label.frame.origin.y = self.label.frame.origin.y+3
            
        }
    }
    
    @objc func buttonLifted(){
        UIView.animate(withDuration: 0.2) {
            self.button.frame.origin.x = self.button.frame.origin.x-3
            self.button.frame.origin.y = self.button.frame.origin.y-3
            
            self.shadow.frame.origin.x = self.shadow.frame.origin.x+3
            self.shadow.frame.origin.y = self.shadow.frame.origin.y-3
            
            self.frontShadow.frame.origin.x = self.frontShadow.frame.origin.x - 10
            self.frontShadow.frame.origin.y = self.frontShadow.frame.origin.y - 10
            
            self.label.frame.origin.x = self.label.frame.origin.x-3
            self.label.frame.origin.y = self.label.frame.origin.y-3
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
