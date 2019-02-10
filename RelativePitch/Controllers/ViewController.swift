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

    
    let musicBox = MusicBox.shareInstance
    var timerView:TimerView!
    
    var chanceLabel:CommonLabel!
    var resultLabel:CommonLabel!
    
    //note keys
    var buttons = Array<KeyButtonView>()
    var smallButtons = Array<KeyButtonView>()
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("appear")
        restart()
        UIView.animate(withDuration: 0.5) {
            appearFromWhite(view: self)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = customRed
        
        //display 3/3 - 0/3
        chanceLabel = CommonLabel(frame:CGRect(x:50,y:50,width:50,height:50))
        chanceLabel.textColor = UIColor.white
        chanceLabel.text = "\(chance)/3"
        self.view.addSubview(chanceLabel)
        
        
        //the clock
        timerView = TimerView(frame: CGRect(x: 110, y: 150, width: 162, height: 162))
        self.view.addSubview(timerView)
        
        //Wrong/Correct/Gameover
        resultLabel = CommonLabel(frame: CGRect(x: (110+162)/2-50, y: 150+162+30, width: 100, height: 30))
        resultLabel.layer.opacity = 0
        resultLabel.textColor = UIColor.white
        self.view.addSubview(resultLabel)
        
        //create all the note keys
        createKey()
        
        //animation for showing note keys
        popKey()

    }
    
    
    func popKey(){
        var i = 0
        while( i < buttons.count){
            UIView.animate(withDuration: 0.5+(0.2*Double(i))) {
                self.buttons[i].frame.origin.y = screenHeight-200
            }
            i+=1
        }
        var j = 0
        while( j < smallButtons.count){
            UIView.animate(withDuration: 0.5+(0.2*Double(i+j))) {
                self.smallButtons[j].frame.origin.y = screenHeight-80
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
                keyView.button.layer.borderColor = customRed.cgColor
                smallButtons.append(keyView)
                self.view.addSubview(keyView)
            }
        }
        
    }

    @objc private func keyReleased(sender:UIButton){
        //print("lifted")
        
        while(musicBox.audioPlayers[sender.tag-10000].volume>0){
            musicBox.audioPlayers[sender.tag-10000].volume = musicBox.audioPlayers[sender.tag-10000].volume - 0.05
            usleep(10000)
            //print(audioPlayers[sender.tag-10000].volume)
        }
        
        
        UIView.animate(withDuration: 2, animations: {
            self.resultLabel.layer.opacity = 1
            self.resultLabel.layer.opacity = 0
        }) { (Bool) in
            self.timerView.replay(gg: gameOver)
        }
        if(gameOver){
            print("game over")
            
            if score > bestScore{
                bestScore = score
                defualts.set(bestScore, forKey: "best")
            }
            
            print(bestScore)
            
            //special transition
            let whiteScreen = UIView(frame: UIScreen.main.bounds)
            whiteScreen.backgroundColor = UIColor.white
            whiteScreen.layer.opacity = 0
            self.view.addSubview(whiteScreen)
            
            UIView.animate(withDuration: 0.5, animations: {
                whiteScreen.layer.opacity = 1
                
            }) { (bool) in
                self.present(GameOverViewController(), animated: false) {
                    whiteTransitionPop(fromView: self)
                }
                whiteScreen.removeFromSuperview()
            }
            
            
        }
    }

    @objc private func keyTapped(sender:UIButton){
        self.timerView.timer.stop()
        musicBox.playSound(index: sender.tag-10000)
        musicBox.audioPlayers[sender.tag-10000].volume = 1
        
        if(!timerView.answered){
            timerView.answered = true
            //correct
            if musicBox.lastNote == musicBox.noteList[sender.tag-10000]{
                score += 1
                timerView.scoreLabel.text = String(score)
                resultLabel.text = "Correct"
                
                //wrong
            }else{
                resultLabel.text = "Wrong"
                chance -= 1
                chanceLabel.text = "\(chance)/3"
                if(chance == 0){
                    resultLabel.text = "Game Over"
                    gameOver = true
                }
            }
        }
        
        
        musicBox.audioPlayers[sender.tag-10000].volume = 1
        
        

    }
    
    
    
}

