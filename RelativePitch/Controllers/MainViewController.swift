//
//  MainViewController.swift
//  RelativePitch
//
//  Created by Chen Wang on 2/8/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    var start:MenuButtonView!

    
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5) {
            appearFromWhite(view: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = customRed
        
        addButtons()
    }
    
    private func addButtons(){
        start = MenuButtonView(frame: CGRect(x: screenWidth/2-100, y: screenHeight/2-100, width: 200, height: 200))
        start.button.tag = startTag
        start.label.text = "START"
        start.button.addTarget(self, action: #selector(buttonLifted(sender:)), for: .touchUpInside)
        start.button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchDown)
        self.view.addSubview(start)
    }
    

    @objc func buttonLifted(sender:UIButton){
        UIView.animate(withDuration: 0.3) {
            self.start.shadow.frame = CGRect(x: 7, y: 7, width: self.start.frame.size.width-7, height: self.start.frame.size.height-7)
            self.start.button.frame = CGRect(x: 0, y: 0, width: self.start.frame.size.width-7, height: self.start.frame.size.height-7)
        }
        switch sender.tag{
        case startTag:
            whiteTransition(fromView: self, toView: ViewController())
        
            
        default:
            print("no such button")
        }
        
    }


    
    
    @objc func buttonPressed(sender:UIButton){
        UIView.animate(withDuration: 0.3) {
            self.start.shadow.frame = CGRect(x: 3, y: 3, width: self.start.frame.size.width-7, height: self.start.frame.size.height-7)
            self.start.button.frame = CGRect(x: 3, y: 3, width: self.start.frame.size.width-7, height: self.start.frame.size.height-7)
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
