//
//  ViewController.swift
//  SwiftKVO
//
//  Created by Amazing on 15/7/29.
//  Copyright © 2015年 Amazing. All rights reserved.
//

import UIKit

private var myContext = 0

class ViewController: UIViewController {

    var myObject: MyClass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myObject = MyClass()
        print("初始化 MyClass,当前日期是 \(myObject.date)")
        myObject.addObserver(self, forKeyPath: "date", options: NSKeyValueObservingOptions.New, context: &myContext)
        
        delay(3.0) { [weak self] in
            guard let strongSelf = self else {
                return
            }
           strongSelf.myObject.date = NSDate()
        }
    }

    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if context == &myContext {
            print("日期发生变化\(change![NSKeyValueChangeNewKey])")
        }
    }
    
    func delay(time: NSTimeInterval, task: Void -> ()) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64( time * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            task()
        }
    }
   
}

