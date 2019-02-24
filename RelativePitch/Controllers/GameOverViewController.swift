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
    var ggLabel:CommonLabel!
    var homeButton:MenuButtonView!
    var replayButton:MenuButtonView!
    

    override func viewWillAppear(_ animated: Bool) {
        if let maxFromData = defualts?.integer(forKey: "best") {
            bestScore = maxFromData
            currentLevel = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearFromWhite(view: self)
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        //add All the Subviews
        addCurrent()
        addBest()
        addGgLabel()
        addReplayButton()
        addHomeButton()
        
    }
    
    
    // MARK: All the Subviews
    
    private func addCurrent(){
        current = CommonLabel(frame: CGRect(x: 0, y: screenHeight/2-150, width: screenWidth, height: 150))
        current.textColor = customRed
        current.text = "\(score)"
        current.font = UIFont(name: "PingFangSC-Light", size: 100)
        self.view.addSubview(current)
    }
    private func addBest(){
        best = CommonLabel(frame: CGRect(x: 0, y: screenHeight/2, width: screenWidth, height: 50))
        best.textColor = customRed
        best.text = "Best Score : \(bestScore)"
        self.view.addSubview(best)
    }
    private func addGgLabel(){
        ggLabel = CommonLabel(frame: CGRect(x: 0, y: screenHeight/2-200, width: screenWidth, height: 50))
        ggLabel.textColor = customRed
        ggLabel.text = "Game Over"
        self.view.addSubview(ggLabel);
    }
    
    private func addReplayButton(){
        replayButton = MenuButtonView(frame: CGRect(x: screenWidth/2-(MenuButtonWidth/2), y: screenHeight/2+100, width: MenuButtonWidth, height: MenuButtonHeight))
        replayButton.button.backgroundColor = customRed
        replayButton.label.textColor = UIColor.white
        replayButton.label.text = "Replay"
        replayButton.button.addTarget(self, action: #selector(replayButtonClicked), for: .touchUpInside)
        replayButton.button.setRoundedCorners(ratio: 0.1)
        replayButton.shadow.setRoundedCorners(ratio: 0.1)
        self.view.addSubview(replayButton)
    }
    
    private func addHomeButton(){
        homeButton = MenuButtonView(frame: CGRect(x: screenWidth/2-(MenuButtonWidth/2), y: screenHeight/2+100+MenuButtonHeight, width: MenuButtonWidth, height: MenuButtonHeight))
        homeButton.label.text = "Home"
        homeButton.button.backgroundColor = customRed
        homeButton.label.textColor = UIColor.white
        homeButton.button.addTarget(self, action: #selector(homeButtonClicked), for: .touchUpInside)
        homeButton.button.setRoundedCorners(ratio: 0.1)
        homeButton.shadow.setRoundedCorners(ratio: 0.1)
        self.view.addSubview(homeButton)
    }
    
    
    
    
    
    
    // MARK: All the Actions
    
    @objc private func replayButtonClicked(){
        reset()
        self.navigationController?.pushViewController(ViewController(), animated: false)
    }
    
    @objc private func homeButtonClicked(){
        reset()

        let controllers = self.navigationController?.viewControllers
        for vc in controllers! {
            if vc is MainViewController {
                _ = self.navigationController?.popToViewController(vc as! MainViewController, animated: false)
            }
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
