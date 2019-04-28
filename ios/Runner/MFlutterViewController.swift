//
//  MFlutterViewController.swift
//  Runner
//
//  Created by chenjunzhi127 on 2019/4/26.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit

class MFlutterViewController: FlutterViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let batteryChannel = FlutterMethodChannel(name: "samples.flutter.io/battery", binaryMessenger: self)
        batteryChannel.setMethodCallHandler { (call, result) in
            if "getBatteryLevel" == call.method {
                result(self.getBatteryLevel())
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
    }
    
    func getBatteryLevel() -> Int {
        return 100;
    }
    
    class func swizzledFlutter() {
//        swizzledMethod(#selector(viewWillAppear(_:)), otherSelector: #selector(swizzed_viewWillAppear(_:)))
//        swizzledMethod(#selector(viewDidDisappear(_:)), otherSelector: #selector(swizzed_viewDidDisappear(_:)))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc func swizzed_viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func swizzed_viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
