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
    
    
    let musicBox = MusicBox.shareInstance
    
    let timer = AppusCircleTimer()
    var scoreLabel:CommonLabel!
    var answered = false;
    
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
        scoreLabel.text = "0"
        self.addSubview(scoreLabel)
    }
    
    
    func setTimers(){
        
        timer.delegate = self
        
        timer.frame = CGRect(x: 0, y: 0, width: frame.size.width-7, height: frame.size.height-7)
        timer.totalTime = 5
        timer.isBackwards = true
        timer.backgroundColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 0)
        timer.inactiveColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 1)
        timer.pauseColor = .white
        timer.isActive = false
        timer.thickness = 10
        
        timer.layer.shadowOpacity = 1 //阴影区域透明度
        timer.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor // 阴影区域颜色
        timer.layer.shadowOffset = CGSize(width: 7, height: 7) //阴影区域范围
        timer.layer.shadowRadius = 0
    
        
        self.addSubview(timer)
        startTimer()
        
    }
    
    
    
    func startTimer(){
        musicBox.PlayRandom()
        timer.start()
    }
    
    func circleCounterTimeDidExpire(circleTimer: AppusCircleTimer) {
        answered = false
        circleTimer.reset()
        circleTimer.isActive = false
        self.startTimer()

    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
