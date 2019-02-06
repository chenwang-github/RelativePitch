//
//  ViewController.swift
//  RelativePitch
//
//  Created by Chen Wang on 1/15/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit
import AppusCircleTimer

class ViewController: UIViewController{
    
    var key:UIButton!
    
    let musicBox = MusicBox.shareInstance
    var timerView:TimerView!
    var score = 0

    
    var btn:UIButton!
    var btn2:UIButton!
    var btn3:UIButton!
    var buttons = Array<KeyButtonView>()
    var smallButtons = Array<KeyButtonView>()
    let keyWidth = (UIScreen.main.bounds.width+5)/7
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //setUp timerView
        timerView = TimerView(frame: CGRect(x: 110, y: 150, width: 162, height: 162))
        self.view.addSubview(timerView)
        
        self.createKey()

        
        
        
        
//
//
//        btn = UIButton(frame: CGRect(x: 0, y: UIScreen.main.bounds.height, width: 50, height: 200))
//        btn.backgroundColor = .white
//        self.view.addSubview(btn)
//        btn2 = UIButton(frame: CGRect(x: 50, y: UIScreen.main.bounds.height, width: 50, height: 200))
//        btn2.backgroundColor = .white
//        self.view.addSubview(btn2)
//        btn3 = UIButton(frame: CGRect(x: 100, y: UIScreen.main.bounds.height, width: 50, height: 200))
//        btn3.backgroundColor = .white
//        self.view.addSubview(btn3)
//
        popKey()
        
        
        
        
        
        //edit view for controller
        self.view.backgroundColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 1)
        
        //create keys and audio players:
        //createKeys()
        
//        let menuButtonView = MenuButtonView(frame: CGRect(x: 100, y: 100, width: 182.82, height: 55))
//        menuButtonView.label.text = "Resume"
//        self.view.addSubview(menuButtonView)
        
//        let dispatchQueue = DispatchQueue(label: "QueueIdentification", qos: .background)
//        dispatchQueue.async{
//            //Time consuming task here
//            while(true){
//                self.musicBox.backgroundPlay(gap: 3)
//            }
//        }
        
        
        
    }
    
    func popKey(){
        var i = 0
        while( i < buttons.count){
            UIView.animate(withDuration: 0.5+(0.2*Double(i))) {
                self.buttons[i].frame.origin.y = UIScreen.main.bounds.height-200
            }
            i+=1
        }
        var j = 0
        while( j < smallButtons.count){
            UIView.animate(withDuration: 0.5+(0.2*Double(i+j))) {
                self.smallButtons[j].frame.origin.y = UIScreen.main.bounds.height-80
            }
            j+=1
        }
        
    }
   
    
    
    
    //MARK: - Buttons(Key) Setup

    
    private func createKey(){
        
        for i in 1...7{
            let keyView = KeyButtonView(frame: CGRect(x: Double(i-1)*Double(keyWidth), y: Double(UIScreen.main.bounds.height), width: Double(keyWidth), height: 230.0))
            keyView.createLargeKey()
            buttons.append(keyView)
            
            keyView.button.tag = i+10000-1
            self.view.addSubview(keyView)
            
            keyView.button.addTarget(self, action: #selector(keyReleased(sender:)), for: .touchUpInside)
            keyView.button.addTarget(self, action: #selector(keyTapped(sender:)), for: .touchDown)
        }
        
        for i in 1...7{
            if (i == 2 || i == 3 || i == 5 || i == 6 || i == 7){
                let keyView = KeyButtonView(frame: CGRect(x: Double(i-1)*Double(keyWidth)-Double(keyWidth*0.3)-5, y: Double(UIScreen.main.bounds.height), width: Double(keyWidth*0.7), height: 230.0*0.5))
                keyView.createSmallKey()
                keyView.button.layer.cornerRadius = 18
                keyView.button.layer.borderWidth = 2
                keyView.button.layer.borderColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 1).cgColor
                smallButtons.append(keyView)
                self.view.addSubview(keyView)
            }
        }
        
    }

    @objc private func keyReleased(sender:KeyButton){
        //print("lifted")
        while(musicBox.audioPlayers[sender.tag-10000].volume>0){
            musicBox.audioPlayers[sender.tag-10000].volume = musicBox.audioPlayers[sender.tag-10000].volume - 0.05
            usleep(10000)
            //print(audioPlayers[sender.tag-10000].volume)
        }
    }

    @objc private func keyTapped(sender:UIButton){
        musicBox.playSound(index: sender.tag-10000)
        musicBox.audioPlayers[sender.tag-10000].volume = 1
        
        if(!timerView.answered){
            timerView.answered = true
            //correct
            if musicBox.lastNote == musicBox.noteList[sender.tag-10000]{
                score += 1
                timerView.scoreLabel.text = String(score)
                //wrong
            }else{
                print(">_<")
            }
        }
        
        
        musicBox.audioPlayers[sender.tag-10000].volume = 1
        
        timerView.timer.stop()
        sleep(1)
        timerView.circleCounterTimeDidExpire(circleTimer: timerView.timer)
        //print("touch down")
    }
    
    
    
}

