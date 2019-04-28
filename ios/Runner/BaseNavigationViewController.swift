//
//  BaseNavigationViewController.swift
//  Runner
//
//  Created by chenjunzhi127 on 2019/4/26.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        print("view did load")
    }    
    
//    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
//        if viewController is FlutterViewController {
//            setNavigationBarHidden(true, animated: true)
//        }
//    }
    
    
}
