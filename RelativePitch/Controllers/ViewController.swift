//
//  ViewController.swift
//  RelativePitch
//
//  Created by Chen Wang on 1/15/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit
import AVFoundation
import AppusCircleTimer

class ViewController: UIViewController, AppusCircleTimerDelegate{
    
    var key:UIButton!
    
    let musicBox = MusicBox.shareInstance
    var btn:UIButton!
    var btn2:UIButton!
    var btn3:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let timer2 = AppusCircleTimer()
        timer2.delegate = self
        
        timer2.frame = CGRect(x: 107, y: 107, width: 155, height: 155)
        timer2.totalTime = 5
        timer2.isBackwards = true
        timer2.backgroundColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 1)
        timer2.inactiveColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 1)
        timer2.pauseColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        timer2.isActive = false
        timer2.thickness = 10
        self.view.addSubview(timer2)
        
        
        let timer = AppusCircleTimer()
        timer.delegate = self
        
        timer.frame = CGRect(x: 100, y: 100, width: 155, height: 155)
        timer.totalTime = 5
        timer.isBackwards = true
        timer.backgroundColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 1)
        timer.inactiveColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 1)
        timer.pauseColor = .white
        timer.isActive = false
        timer.thickness = 10
        self.view.addSubview(timer)
        
        
        
        timer.start()
        timer2.start()
        
        
        btn = UIButton(frame: CGRect(x: 0, y: UIScreen.main.bounds.height, width: 50, height: 200))
        btn.backgroundColor = .white
        self.view.addSubview(btn)
        btn2 = UIButton(frame: CGRect(x: 50, y: UIScreen.main.bounds.height, width: 50, height: 200))
        btn2.backgroundColor = .white
        self.view.addSubview(btn2)
        btn3 = UIButton(frame: CGRect(x: 100, y: UIScreen.main.bounds.height, width: 50, height: 200))
        btn3.backgroundColor = .white
        self.view.addSubview(btn3)
        
        popKey()
        
        
        
        //edit view for controller
        self.view.backgroundColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 1)
        
        //create keys and audio players:
        //createKeys()
        
//        let menuButtonView = MenuButtonView(frame: CGRect(x: 100, y: 100, width: 182.82, height: 55))
//        self.view.addSubview(menuButtonView)
        
//        let dispatchQueue = DispatchQueue(label: "QueueIdentification", qos: .background)
//        dispatchQueue.async{
//            //Time consuming task here
//
//        }
    
    }
    
    
    func popKey(){
        UIView.animate(withDuration: 0.5) {
            self.btn.frame =  CGRect(x: 0, y: UIScreen.main.bounds.height-200, width: 50, height: 200)
        }
        UIView.animate(withDuration: 0.7) {
            self.btn2.frame =  CGRect(x: 50, y: UIScreen.main.bounds.height-200, width: 50, height: 200)
        }
        UIView.animate(withDuration: 0.9) {
            self.btn3.frame =  CGRect(x: 100, y: UIScreen.main.bounds.height-200, width: 50, height: 200)
        }
    }
   
    func circleCounterTimeDidExpire(circleTimer: AppusCircleTimer) {
        circleTimer.reset()
        circleTimer.isActive = false
        circleTimer.start()
    }
    
    
    
    //MARK: - Buttons(Key) Setup
    private func createKeys(){
        var index = 0
        while(index<musicBox.noteList.count){
            createKey(index: index)
            index+=1
        }
    }
    
    private func createKey(index:Int){
        key = UIButton(frame: CGRect(x: 100, y: index*50+index*10+50, width: 50, height: 50))
        key.tag = index+10000
        key.backgroundColor = UIColor.white
        key.addTarget(self, action: #selector(keyTapped(sender:)), for: .touchDown)
        key.addTarget(self, action: #selector(keyReleased(sender:)), for: .touchUpInside)
        self.view.addSubview(key)
    }

    @objc private func keyReleased(sender:KeyButton){
        print("lifted")
        while(musicBox.audioPlayers[sender.tag-10000].volume>0){
            musicBox.audioPlayers[sender.tag-10000].volume = musicBox.audioPlayers[sender.tag-10000].volume - 0.05
            usleep(10000)
            //print(audioPlayers[sender.tag-10000].volume)
        }
    }
    
    @objc private func keyTapped(sender:UIButton){
        musicBox.playSound(index: sender.tag-10000)
        musicBox.audioPlayers[sender.tag-10000].volume = 1
        print("touch down")
    }
    
    
    
}

