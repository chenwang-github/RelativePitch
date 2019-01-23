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

class ViewController: UIViewController{
    
    var key:UIButton!
    
    let musicBox = MusicBox.shareInstance
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
        let timerView = TimerView(frame: CGRect(x: 110, y: 150, width: 162, height: 162))
        self.view.addSubview(timerView)
        
        for i in 1...7{
            let keyButtonView = KeyButtonView(frame: CGRect(x: Double(i-1)*Double(keyWidth), y: Double(UIScreen.main.bounds.height), width: Double(keyWidth), height: 230.0))
            keyButtonView.createLargeKey()
            buttons.append(keyButtonView)
            self.view.addSubview(keyButtonView)
        }
        
        for i in 1...7{
            if (i == 2 || i == 3 || i == 5 || i == 6 || i == 7){
                print(i)
                let smallKeyButtonView = KeyButtonView(frame: CGRect(x: Double(i-1)*Double(keyWidth)-Double(keyWidth*0.3)-5, y: Double(UIScreen.main.bounds.height), width: Double(keyWidth*0.7), height: 230.0*0.5))
                smallKeyButtonView.createSmallKey()
                smallKeyButtonView.button.layer.cornerRadius = 18
                smallKeyButtonView.button.layer.borderWidth = 2
                smallKeyButtonView.button.layer.borderColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 1).cgColor
                smallButtons.append(smallKeyButtonView)
                self.view.addSubview(smallKeyButtonView)
            }
        }
        
        
        
        
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
//
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

