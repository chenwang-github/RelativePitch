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
    var noteList = ["Piano-C3","Piano-D3","Piano-E3","Piano-F3","Piano-G3","Piano-A3","Piano-B3"]
    
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
        audioPlayers[index].currentTime = 0
        audioPlayers[index].play()
        
    }
    
    
    public func PlayRandom(){
        
        let index = Int.random(in: 0 ..< noteList.count)
        playSound(index: index)
        lastNote = noteList[index]
        print(lastNote!)
    }

//    public func backgroundPlay(gap:UInt32){
//        sleep(gap)
//        PlayRandom()
//        print(lastNote!)
//    }
}
