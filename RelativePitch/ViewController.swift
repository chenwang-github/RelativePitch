//
//  ViewController.swift
//  RelativePitch
//
//  Created by Chen Wang on 1/15/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var key:UIButton!
    
    let musicBox = MusicBox.shareInstance


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //edit view for controller
        self.view.backgroundColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 1)
        
        //create keys and audio players:
        createKeys()
        
        
        let dispatchQueue = DispatchQueue(label: "QueueIdentification", qos: .background)
        dispatchQueue.async{
            //Time consuming task here
            
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

