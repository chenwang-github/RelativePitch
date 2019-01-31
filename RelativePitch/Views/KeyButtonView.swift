//
//  KeyButtonView.swift
//  RelativePitch
//
//  Created by Chen Wang on 1/20/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit

class KeyButtonView: UIView {

    let musicBox = MusicBox.shareInstance
    var button:UIButton!
    var shadow:UIView!
    var frontShadow:UIView!
    var label:CommonLabel!
    var myFrame:CGRect!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        //my modification
        self.clipsToBounds = true
        myFrame = frame
    }
    
    func createSmallKey(){
        setButton(frame:myFrame, isSmallKey:true)
        setLabel(frame:myFrame, isSmallKey:true)
    }
    
    func createLargeKey(){
        setButton(frame:myFrame, isSmallKey:false)
        setLabel(frame:myFrame, isSmallKey:false)
    }
    
    func setButton(frame:CGRect, isSmallKey:Bool){
        
        //Common Part
        button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.width-5, height: frame.height-5))
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchDown)
        button.addTarget(self, action: #selector(buttonLifted(sender:)), for: .touchUpInside)
        
        shadow = UIView(frame: CGRect(x: 5, y: 5, width: frame.width, height: frame.height))
        shadow.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        shadow.layer.cornerRadius = 25
        shadow.clipsToBounds = true
    
        
        frontShadow = UIView(frame: CGRect(x: -(frame.width-5), y: 0, width: frame.width-5, height: frame.height-5))
        frontShadow.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        frontShadow.layer.cornerRadius = 25
        frontShadow.clipsToBounds = true
        
        if isSmallKey{
            frontShadow.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        }
        
        
        self.addSubview(shadow)
        self.addSubview(button)
        self.addSubview(frontShadow)
    }
    
    func setLabel(frame:CGRect, isSmallKey:Bool){
        //setup Label
        if isSmallKey{
            
            label = CommonLabel(frame: CGRect(x: 0, y: 0, width: frame.size.width-5, height: frame.size.width+10))
            label.text = "A"
            label.font = UIFont(name: "PingFangSC-Light", size: 15)
            self.addSubview(label)
            
        }else{
            label = CommonLabel(frame: CGRect(x: 0, y: 0, width: frame.size.width-5, height: frame.size.width+10))
            label.text = "A"
            self.addSubview(label)
        }
    }
    
    
    @objc func buttonPressed(sender:UIButton){
        
        musicBox.playSound(index: sender.tag-10000)
        if musicBox.lastNote == musicBox.noteList[sender.tag-10000]{
            print("Bingo")
        }else{
            print(">_<")
        }
        musicBox.audioPlayers[sender.tag-10000].volume = 1
        
        print("touch down")
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
    
    @objc func buttonLifted(sender :UIButton){
        print("lifted")
        while(musicBox.audioPlayers[sender.tag-10000].volume>0){
            musicBox.audioPlayers[sender.tag-10000].volume = musicBox.audioPlayers[sender.tag-10000].volume - 0.05
            usleep(10000)
            //print(audioPlayers[sender.tag-10000].volume)
        }
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
