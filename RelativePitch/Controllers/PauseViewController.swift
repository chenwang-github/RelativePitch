//
//  PauseViewController.swift
//  RelativePitch
//
//  Created by Chen Wang on 2/14/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit

protocol PauseViewDelegate {
    func passValue(gg:Bool)
}

class PauseViewController: UIViewController {

    var current:CommonLabel!
    var best:CommonLabel!
    var resume:MenuButtonView!
    var home:MenuButtonView!
    var delegate:PauseViewDelegate!
    
    override func viewWillAppear(_ animated: Bool) {
        if let maxFromData = defualts?.integer(forKey: "best") {
            bestScore = maxFromData
            currentLevel = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        addLabels()
        addButtons()
        
    }
    
    //add current and best here
    private func addLabels(){
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
    
    //add resume or home button here
    private func addButtons(){
        resume = MenuButtonView(frame: CGRect(x: screenWidth/2-(MenuButtonWidth/2), y: screenHeight/2+100, width: MenuButtonWidth, height: MenuButtonHeight))
        resume.button.backgroundColor = customRed
        resume.label.textColor = UIColor.white
        resume.button.addTarget(self, action: #selector(resumeGame), for: .touchUpInside)
        resume.button.setRoundedCorners(ratio: 0.1)
        resume.shadow.setRoundedCorners(ratio: 0.1)
        self.view.addSubview(resume)
        
        home = MenuButtonView(frame: CGRect(x: screenWidth/2-(MenuButtonWidth/2), y: screenHeight/2+100+MenuButtonHeight, width: MenuButtonWidth, height: MenuButtonHeight))
        home.label.text = "Home"
        home.button.backgroundColor = customRed
        home.label.textColor = UIColor.white
        home.button.addTarget(self, action: #selector(quitGame), for: .touchUpInside)
        home.button.setRoundedCorners(ratio: 0.1)
        home.shadow.setRoundedCorners(ratio: 0.1)
        self.view.addSubview(home)
    }

    
    @objc private func resumeGame(){
        dismiss(animated: true) {
            self.delegate.passValue(gg:false)
        }
    }
    
    @objc private func quitGame(){
        gameOver = true
        dismiss(animated: true) {
            self.delegate.passValue(gg:true)
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


