//
//  GameOverViewController.swift
//  RelativePitch
//
//  Created by Chen Wang on 2/8/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    
    var current:CommonLabel!
    var best:CommonLabel!

    override func viewWillAppear(_ animated: Bool) {
        if let maxFromData = defualts?.integer(forKey: "best") {
            bestScore = maxFromData
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        current = CommonLabel(frame: CGRect(x: 0, y: screenHeight/2-150, width: screenWidth, height: 150))
        current.textColor = customRed
        current.text = "\(score)"
        current.font = UIFont(name: "PingFangSC-Light", size: 100)
        self.view.addSubview(current)
        
        best = CommonLabel(frame: CGRect(x: 0, y: screenHeight/2, width: screenWidth, height: 50))
        best.textColor = customRed
        best.text = "Best Score : \(bestScore)"
        self.view.addSubview(best)
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: false) {
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
