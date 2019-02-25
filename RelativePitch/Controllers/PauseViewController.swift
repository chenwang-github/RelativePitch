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
    var quit:MenuButtonView!
    var delegate:PauseViewDelegate!
    
    override func viewWillAppear(_ animated: Bool) {
        if let maxFromData = defualts?.integer(forKey: "best") {
            bestScore = maxFromData
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        addLabels()
        addButtons()
        
    }
    
    // MARK: add Subviews here
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
    private func addButtons(){
        resume = MenuButtonView(frame: CGRect(x: screenWidth/2-(MenuButtonWidth/2), y: screenHeight/2+100, width: MenuButtonWidth, height: MenuButtonHeight))
        resume.button.backgroundColor = customRed
        resume.label.textColor = UIColor.white
        resume.button.addTarget(self, action: #selector(resumeGame), for: .touchUpInside)
        resume.button.setRoundedCorners(ratio: 0.1)
        resume.shadow.setRoundedCorners(ratio: 0.1)
        self.view.addSubview(resume)
        
        quit = MenuButtonView(frame: CGRect(x: screenWidth/2-(MenuButtonWidth/2), y: screenHeight/2+100+MenuButtonHeight, width: MenuButtonWidth, height: MenuButtonHeight))
        quit.label.text = "Quit"
        quit.button.backgroundColor = customRed
        quit.label.textColor = UIColor.white
        quit.button.addTarget(self, action: #selector(quitGame), for: .touchUpInside)
        quit.button.setRoundedCorners(ratio: 0.1)
        quit.shadow.setRoundedCorners(ratio: 0.1)
        self.view.addSubview(quit)
    }

    // MARK: add Actions here
    @objc private func resumeGame(){
        dismiss(animated: true) {
            self.delegate.passValue(gg:false)
        }
    }
    @objc private func quitGame(){
        dismiss(animated: true) {
            self.delegate.passValue(gg:true)
        }
    }
    
   
}



