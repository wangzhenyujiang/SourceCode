//
//  ViewController.swift
//  VisualEffectTest
//
//  Created by Amazing on 15/7/29.
//  Copyright © 2015年 Amazing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgView = UIImageView(image: UIImage(named: "bg"))
        bgView.frame = self.view.frame
        self.view.addSubview(bgView)
        
        let blurEffect: UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRectMake(50, 50, self.view.frame.width - 100, 200)
        let label = UILabel(frame: CGRectMake(0, 0, 100, 40))
        label.text = "Amaizng"
        blurView.contentView.addSubview(label)
        self.view.addSubview(blurView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

