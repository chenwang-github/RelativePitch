//
//  PlaySongController.swift
//  RelativePitch
//
//  Created by Chen Wang on 2/24/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit


class PlaySongController: UIViewController {
    var keyLabel = [10000:"C",
                    10001:"D",
                    10002:"E",
                    10003:"F",
                    10004:"G",
                    10005:"A",
                    10006:"B",
                    10007:"Db",
                    10008:"Eb",
                    10009:"Gb",
                    10010:"Ab",
                    10011:"Bb"]
    
    
    let song : [[Int:Int]] = [[5:500000],[3:500000],[3:1000000],
                              [4:500000],[2:500000],[2:1000000],
                              [1:500000],[2:500000],[3:500000],[4:500000],
                              [5:500000],[5:500000],[5:1000000],
                              [5:500000],[3:500000],[3:1000000],
                              [4:500000],[2:500000],[2:1000000],
                              [1:500000],[3:500000],[5:500000],[5:500000],
                              [3:1000000]]
    
    let musicBox = MusicBox.shareInstance
    var pitchInput : [Int] = []
    
    //note keys
    var buttons = Array<KeyButtonView>()
    var smallButtons = Array<KeyButtonView>()
    
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5) {
            appearFromWhite(view: self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playSong(song: song)
        //enableKeys = levels[currentLevel]!
        
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = customRed
        
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
    
    
    
    
    //MARK: add Subviews here
    private func createKey(){
        
        //large key
        for i in 1...7{
            let keyView = KeyButtonView(frame: CGRect(x: Double(i-1)*Double(keyWidth), y: Double(UIScreen.main.bounds.height), width: Double(keyWidth), height: 230.0))
            keyView.createLargeKey()
            buttons.append(keyView)
            
            keyView.button.tag = i+10000-1
            keyView.tag = i+10000-1
            keyView.label.text = keyLabel[i+10000-1]
            
            if !enableKeys[keyView.button.tag]!{
                keyView.layer.opacity = opLevel
            }
            
            self.view.addSubview(keyView)
            
            keyView.button.addTarget(self, action: #selector(keyReleased(sender:)), for: .touchUpInside)
            keyView.button.addTarget(self, action: #selector(keyTapped(sender:)), for: .touchDown)
        }
        
        
        //small key
        let smallKeyDict = [8:2,9:3,10:5,11:6,12:7]
        for j in 8...12{
            let i = smallKeyDict[j]!
            let keyView = KeyButtonView(frame: CGRect(x: Double(i-1)*Double(keyWidth)-Double(keyWidth*0.3)-5, y: Double(UIScreen.main.bounds.height), width: Double(keyWidth*0.7), height: 230.0*0.5))
            keyView.createSmallKey()
            keyView.button.layer.cornerRadius = 18
            keyView.button.layer.borderWidth = 2
            keyView.button.layer.borderColor = customRed.cgColor
            keyView.button.tag = j+10000-1
            keyView.tag = j+10000-1
            keyView.label.text = keyLabel[j+10000-1]
            
            if !enableKeys[keyView.button.tag]!{
                keyView.layer.opacity = opLevel
            }
            
            smallButtons.append(keyView)
            self.view.addSubview(keyView)
            
            keyView.button.addTarget(self, action: #selector(keyReleased(sender:)), for: .touchUpInside)
            keyView.button.addTarget(self, action: #selector(keyTapped(sender:)), for: .touchDown)
        }
        
    }
    
    
    
    // MARK: add Actions are here
    @objc private func keyReleased(sender:UIButton){
    
        //enableKeys = levels[currentLevel]!
      
        
        while(musicBox.audioPlayers[sender.tag-10000].volume>0){
            musicBox.audioPlayers[sender.tag-10000].volume = musicBox.audioPlayers[sender.tag-10000].volume - 0.05
            usleep(10000)
            //print(audioPlayers[sender.tag-10000].volume)
        }
        
        //print("released")
    }
    @objc private func keyTapped(sender:UIButton){
        if (!enableKeys[sender.tag]!){
            return
        }
        
        pitchInput.append(sender.tag-10000)
        if check(){
            print("correct")
        }else{
            print("wrong")
        }
        musicBox.playSound(index: sender.tag-10000)
        //musicBox.audioPlayers[sender.tag-10000].volume = 1
        
        //print("pressed")
    }


    // MARK: Game logic
    private func check()-> Bool {
        for (key,_) in song[pitchInput.count-1]{

            if pitchInput[pitchInput.count-1]+1 == key{
                return true
            }else{
                return false
            }
        }
        return false
    }
    private func playSong(song:[[Int:Int]]){
        for i in song{
            for (key,value) in i{
                let k = key-1
                print("play\(key)")
                //musicBox.audioPlayers[k].volume = 1
                musicBox.playSound(index: k)
                print(musicBox.audioPlayers[k].volume)
                usleep(useconds_t(value))
                
                while(musicBox.audioPlayers[k].volume>0){
                    musicBox.audioPlayers[k].volume = musicBox.audioPlayers[k].volume - 0.05
                    usleep(5000)
                    //print(audioPlayers[sender.tag-10000].volume)
                }
            }
        }
    }
    
}

