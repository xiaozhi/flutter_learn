//
//  NativeVC.swift
//  Runner
//
//  Created by chenjunzhi127 on 2019/4/22.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit

class NativeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: .system)
        button.setTitle("我是一个原生的ViewController", for: .normal)
        self.view.addSubview(button)
        
        let centerX = NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let centerY = NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        
        self.view.addConstraints([centerY,centerX])
        
    }
}
