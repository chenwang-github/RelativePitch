//
//  SoundIsOnController.swift
//  RelativePitch
//
//  Created by Chen Wang on 2/23/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit

class ReminderController: UIViewController {

    
    var ruleLabel:CommonLabel!
    var descriptionLabel:CommonLabel!
    var reminderView:UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5) {
            appearFromWhite(view: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        addReminderView()
    }
    

    // Mark: add Subviews here
    
    
    private func addReminderView(){
        reminderView = UIView(frame: CGRect(x: 0, y: screenHeight/2-80, width: screenWidth, height: 160))
        reminderView.backgroundColor = customRed
        addRuleLabel()
        addDescriptionLabel()
    }
    
    private func addRuleLabel(){
        ruleLabel = CommonLabel(frame: CGRect(x: 0, y: 30, width: screenWidth, height: 50))
        ruleLabel.textColor = UIColor.white
        ruleLabel.text = "RULE"
        ruleLabel.font = UIFont(name: "PingFangSC-Light", size: 25)
        reminderView.addSubview(ruleLabel)
        self.view.addSubview(reminderView)
        

        //current.font = UIFont(name: "PingFangSC-Light", size: 100)
    }
    private func addDescriptionLabel(){
        descriptionLabel = CommonLabel(frame: CGRect(x: 0, y: 80, width: screenWidth, height: 50))
        descriptionLabel.textColor = UIColor.white
        descriptionLabel.text = "Press on the pitch you hear"
        descriptionLabel.font = UIFont(name: "PingFangSC-Light", size: 20)
        reminderView.addSubview(descriptionLabel)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        whiteTransition(fromView: self, toView: PlaySongController())
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
