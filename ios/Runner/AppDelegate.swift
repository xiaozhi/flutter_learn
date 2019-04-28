import UIKit
import Flutter
import ObjectiveC

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    
    
    window.makeKeyAndVisible()
    
    
//    FlutterViewController *controller = (FlutterViewController *)self.window.rootViewController;
    
//    if let controller = self.window.rootViewController as? UINavigationController,
//        let flutterVC = controller.childViewControllers.first as? FlutterViewController {
//        flutterVC.title = "测试"
//
//        let batteryChannel = FlutterMethodChannel(name: "samples.flutter.io/battery", binaryMessenger: flutterVC)
//
//        batteryChannel.setMethodCallHandler { (call, result) in
//            if "getBatteryLevel" == call.method {
//                result(self.getBatteryLevel())
//            } else {
//                result(FlutterMethodNotImplemented)
//            }
//        }
//    }
//
    
    MFlutterViewController.swizzledFlutter()
//    MFlutterViewController.swizzledMethod(#selector(viewWillAppear:), otherSelector: #selector(viewDidDisappear:))
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    
  }
    func getBatteryLevel() -> Int {
        return 100;
    }

}

extension UIViewController {
    
    class func swizzledMethod(_ originSelector: Selector, otherSelector: Selector) {
        guard let originMethod = class_getInstanceMethod(self, originSelector),
            let otherMethod = class_getInstanceMethod(self, otherSelector) else {
            return
        }
        
        let impR = class_getMethodImplementation(self, originSelector)
        let typeR = method_getTypeEncoding(originMethod)
        
        class_addMethod(self, originSelector, impR!, typeR!)
        
        
        guard let imp = class_getMethodImplementation(self, otherSelector),
            let type = method_getTypeEncoding(otherMethod) else {
                return
        }
        let result = class_addMethod(self, otherSelector, imp, type)
        
        let childOriginMethod = class_getInstanceMethod(self, originSelector)!
        
        
        method_exchangeImplementations(childOriginMethod, otherMethod)
    }
}
