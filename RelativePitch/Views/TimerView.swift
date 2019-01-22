//
//  TimerView.swift
//  RelativePitch
//
//  Created by Chen Wang on 1/21/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit
import AppusCircleTimer

class TimerView: UIView , AppusCircleTimerDelegate {
    
    var scoreLabel:CommonLabel!
    
//    let scoreLabel:UILabel
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        //my modification
        
        setScoreLabel()
        setTimers()
        
    }
    
    func setScoreLabel(){
        scoreLabel = CommonLabel(frame: CGRect(x: 0, y: 0, width: frame.size.width-7, height: frame.size.height-7))
        scoreLabel.backgroundColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 1)
        scoreLabel.textColor = .white
        scoreLabel.font = UIFont(name: "PingFangSC-Light", size: 38)
        scoreLabel.text = "3"
        self.addSubview(scoreLabel)
    }
    
    
    func setTimers(){
        
        let timer = AppusCircleTimer()
        timer.delegate = self
        
        timer.frame = CGRect(x: 0, y: 0, width: frame.size.width-7, height: frame.size.height-7)
        timer.totalTime = 5
        timer.isBackwards = true
        timer.backgroundColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 0)
        timer.inactiveColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 1)
        timer.pauseColor = .white
        timer.isActive = false
        timer.thickness = 10
        
        
        let timer2 = AppusCircleTimer()
        timer2.delegate = self
        
        timer2.frame = CGRect(x: 7, y: 7, width: frame.size.width-7, height: frame.size.height-7)
        timer2.totalTime = 5
        timer2.isBackwards = true
        timer2.backgroundColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 0)
        timer2.inactiveColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 1)
        timer2.pauseColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        timer2.isActive = false
        timer2.thickness = 10
        
        
        
        self.addSubview(timer2)
        self.addSubview(timer)
        
        
        
        timer.start()
        timer2.start()
    }
    
    func circleCounterTimeDidExpire(circleTimer: AppusCircleTimer) {
        circleTimer.reset()
        circleTimer.isActive = false
        circleTimer.start()
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
