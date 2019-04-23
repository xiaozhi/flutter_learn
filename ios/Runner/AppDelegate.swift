import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    
//    FlutterViewController *controller = (FlutterViewController *)self.window.rootViewController;
    
    if let controller = self.window.rootViewController as? UINavigationController,
        let flutterVC = controller.childViewControllers.first as? FlutterViewController {
        flutterVC.title = "测试"
        
        let batteryChannel = FlutterMethodChannel(name: "samples.flutter.io/battery", binaryMessenger: flutterVC)
        
        batteryChannel.setMethodCallHandler { (call, result) in
            if "getBatteryLevel" == call.method {
                result(self.getBatteryLevel())
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
    }
//

    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    
  }
    func getBatteryLevel() -> Int {
        return 100;
    }
    
}
