//
//  GlobalFile.swift
//  RelativePitch
//
//  Created by Chen Wang on 2/9/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit

//storage
var defualts:UserDefaults!

//game progress
var score = 0
var bestScore = 0
var chance = 5
var scoreToNextLevel = 1
var maxLevel = 15
var gameOver = false
var stopped = false


//Frame
let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height
let keyWidth = (screenWidth+5)/7
let MenuButtonWidth = screenWidth/2
let MenuButtonHeight = screenWidth/6



//Color
let tranparent = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 0).cgColor
let customRed = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 1)
let shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
let opLevel :Float = 0.3

//Tag
let startTag = 200001

//function
public func reset(){
    score = 0
    chance = 5
    gameOver = false
    currentLevel = 1
    enableKeys = levels[currentLevel]!
    scoreToNextLevel = 2
}



var levels : [Int: [Int:Bool]] = [1:level1,2:level2,3:level3,4:level4,5:level5,6:level6,7:level7,8:level8,9:level9,10:level10,11:level11,12:level12,13:level13,14:level14,15:level15]
var currentLevel = 1

var enableKeys : [Int:Bool] = [:]






public func whiteTransition(fromView:UIViewController, toView:UIViewController){
    let whiteScreen = UIView(frame: UIScreen.main.bounds)
    whiteScreen.backgroundColor = UIColor.white
    whiteScreen.layer.opacity = 0
    fromView.view.addSubview(whiteScreen)
    
    UIView.animate(withDuration: 0.5, animations: {
        whiteScreen.layer.opacity = 1
        
    }) { (bool) in
        fromView.navigationController?.pushViewController(toView, animated: false)
        whiteScreen.removeFromSuperview()
    }
}

public func whiteTransitionPop(fromView:UIViewController){
    let whiteScreen = UIView(frame: UIScreen.main.bounds)
    whiteScreen.backgroundColor = UIColor.white
    whiteScreen.layer.opacity = 0
    fromView.view.addSubview(whiteScreen)
    
    UIView.animate(withDuration: 0.5, animations: {
        whiteScreen.layer.opacity = 1
        
    }) { (bool) in
        fromView.navigationController?.popViewController(animated: false)
        whiteScreen.removeFromSuperview()
    }
}



public func appearFromWhite(view:UIViewController){
    let whiteScreen = UIView(frame: UIScreen.main.bounds)
    whiteScreen.backgroundColor = UIColor.white
    whiteScreen.layer.opacity = 1
    view.view.addSubview(whiteScreen)
    
    UIView.animate(withDuration: 0.5, animations: {
        whiteScreen.layer.opacity = 0
        
    }) { (bool) in
        whiteScreen.removeFromSuperview()
    }
}



extension UIView {
    func setRoundedCorners(ratio: Double?) {
        if let r = ratio {
            self.layer.cornerRadius = self.frame.size.width*CGFloat(r) // for specific corner ratio
        } else {
            
            // circle
            // i would put a condition, as width and height differ:
            if(self.frame.size.width == self.frame.size.height) {
                self.layer.cornerRadius = self.frame.size.width/2 // for circles
            } else {
                //
            }
        }
        self.layer.borderWidth = 0
    }
}
