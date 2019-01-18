//
//  ViewController.swift
//  RelativePitch
//
//  Created by Chen Wang on 1/15/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var key:UIButton!
    var noteList = ["Piano-C3","Piano-D3","Piano-E3","Piano-F3","Piano-G3","Piano-A3","Piano-B3"]
    var audioPlayers = Array<AVAudioPlayer>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //set backgroundColor
        self.view.backgroundColor = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 1)
        
        //try adding keys:
        
        var index = 0
        while(index<noteList.count){
            createKeys(index: index)
            index+=1
        }

        let dispatchQueue = DispatchQueue(label: "QueueIdentification", qos: .background)
        dispatchQueue.async{
            //Time consuming task here
            
        }
        
        createAudioPlayers()

    }
    
    private func createKeys(index:Int){
        key = UIButton(frame: CGRect(x: 100, y: index*50+index*10+50, width: 50, height: 50))
        key.tag = index+10000
        key.backgroundColor = UIColor.white
        key.addTarget(self, action: #selector(keyTapped(sender:)), for: .touchDown)
        key.addTarget(self, action: #selector(keyReleased(sender:)), for: .touchUpInside)
        self.view.addSubview(key)
    }

    @objc private func keyReleased(sender:KeyButton){
        print("lifted")
        while(audioPlayers[sender.tag-10000].volume>0){
            audioPlayers[sender.tag-10000].volume = audioPlayers[sender.tag-10000].volume - 0.05
            usleep(10000)
            //print(audioPlayers[sender.tag-10000].volume)
        }
    }
    
    @objc private func keyTapped(sender:UIButton){
        playSound(index: sender.tag-10000)
        audioPlayers[sender.tag-10000].volume = 1
        print("touch down")
    }
    
    
    private func createAudioPlayers(){
        var count = 0
        var audioPlayer = AVAudioPlayer()
        while(count<noteList.count){
            let soundURL = Bundle.main.url(forResource: noteList[count], withExtension: "wav")
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            }
            catch{
                print(error)
            }
            audioPlayers.append(audioPlayer)
            count+=1
        }
    }
    
    private func playSound(index:Int){
        audioPlayers[index].currentTime = 0
        audioPlayers[index].play()
        
    }
    
    
    private func PlayRandom(){
        let index = Int.random(in: 0 ..< noteList.count)
        playSound(index: index)
    }

    
    
    private func backgroundPlay(){
        sleep(2)
        PlayRandom()
        
    }
    
}

