//
//  MainViewController.swift
//  RelativePitch
//
//  Created by Chen Wang on 2/8/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    var scrollView:UIScrollView!
    var start:MenuButtonView!
    
    override func viewWillAppear(_ animated: Bool) {
        //trasition
        UIView.animate(withDuration: 0.5) {
            appearFromWhite(view: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = customRed
        addButtons()
        //addScrollView()
    }
    
    
    private func addScrollView(){
        let imageView=UIImageView(image:UIImage(named:"ss"))
        let scrollView=UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: imageView.frame.size.height))
        scrollView.backgroundColor = UIColor.white
        scrollView.contentSize=imageView.bounds.size;
        scrollView.addSubview(imageView);
    
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollView)
    }
    
    private func addButtons(){
        start = MenuButtonView(frame: CGRect(x: screenWidth/2-100, y: screenHeight/2-100, width: 200, height: 200))
        start.button.tag = startTag
        start.label.text = "START"
        start.button.addTarget(self, action: #selector(buttonLifted(sender:)), for: .touchUpInside)
        start.button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchDown)
        start.button.setRoundedCorners(ratio: 0.1)
        start.shadow.setRoundedCorners(ratio: 0.1)
        self.view.addSubview(start)
    }
    

    @objc func buttonLifted(sender:UIButton){
        switch sender.tag{
        case startTag:
            whiteTransition(fromView: self, toView: ViewController())
        
            
        default:
            print("no such button")
        }
        
    }


    
    
    @objc func buttonPressed(sender:UIButton){
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

