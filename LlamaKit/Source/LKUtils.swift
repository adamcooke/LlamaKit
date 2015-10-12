public class LKUtils {
    
    public static func pathToResource(name:String) -> String {
        let bundleDir = NSBundle(forClass: self).pathForResource("LKResources", ofType: "bundle")! as NSString
        return bundleDir.stringByAppendingPathComponent(name)
    }
    
    public static func convertDeviceTokenToString(data:NSData) -> String {
        let tokenChars = UnsafePointer<CChar>(data.bytes)
        var tokenString = ""
        for var i = 0; i < data.length; i++ {
            tokenString += String(format: "%02.2hhx", arguments: [tokenChars[i]])
        }
        return tokenString
    }
    
    static func onMainThread(handler: () -> ()) {
        dispatch_async(dispatch_get_main_queue(), handler)
    }

    static func displayError(viewController: UIViewController, message: String, withErrorCode errorCode: Int) {
        let actualMessage = "\(message)\n\nError Code: \(errorCode)"
        let alertView = UIAlertController(title: "Error", message: actualMessage, preferredStyle: UIAlertControllerStyle.Alert)
        alertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        viewController.presentViewController(alertView, animated: true, completion: nil)
    }
    
    static func displayErrorOnMainThread(viewController: UIViewController, message: String, withErrorCode errorCode :Int) {
        dispatch_async(dispatch_get_main_queue(),{
            displayError(viewController, message: message, withErrorCode: errorCode)
        })
    }

    static func setColorForAllLabelsInView(color: UIColor, inView view:UIView) {
        for subView in view.subviews {
            if subView is UILabel {
                (subView as! UILabel).textColor = color
            }
            setColorForAllLabelsInView(color, inView: subView)
        }
    }    
    
}