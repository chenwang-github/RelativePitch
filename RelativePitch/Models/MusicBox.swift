//
//  MusicBox.swift
//  RelativePitch
//
//  Created by Chen Wang on 1/17/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import Foundation
import AVFoundation



class MusicBox{
    
    public static let shareInstance = MusicBox()
    
    //noteList stores all the notes
    var noteList = ["Piano-C3","Piano-D3","Piano-E3","Piano-F3","Piano-G3","Piano-A3","Piano-B3","Piano-Db3","Piano-Eb3","Piano-Gb3","Piano-Ab3","Piano-Bb3"]
    
    var lastNote:String!
    
    //noteList stores all the audioPlayers
    var audioPlayers = Array<AVAudioPlayer>()
    
    
    init(){
        createAudioPlayers()
    }
    

    
    
    //Mark: - AVAudioPlayer Setup
    
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
    
    public func playSound(index:Int){
        audioPlayers[index].volume = 1
        audioPlayers[index].stop()
        audioPlayers[index].currentTime = 0
        audioPlayers[index].play()
        
    }
    
    
    public func PlayRandom(){
        
        let index = Int.random(in: 0 ..< noteList.count)
        enableKeys = levels[currentLevel]!
        if enableKeys[index+10000]!{
            playSound(index: index)
            lastNote = noteList[index]
            print(lastNote!)
        }else{
            PlayRandom()
        }
    }

//    public func backgroundPlay(gap:UInt32){
//        sleep(gap)
//        PlayRandom()
//        print(lastNote!)
//    }
}
