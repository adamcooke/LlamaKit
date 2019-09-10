open class LKUtils {
    
    public static func pathToResource(_ name:String) -> String {
        let bundleDir = Bundle(for: self).bundlePath as NSString
        return bundleDir.appendingPathComponent(name)
    }
    
    public static func convertDeviceTokenToString(_ data:Data) -> String {
        let tokenChars = (data as NSData).bytes.bindMemory(to: CChar.self, capacity: data.count)
        var tokenString = ""
        for i in 0...data.count - 1 {
            tokenString += String(format: "%02.2hhx", arguments: [tokenChars[i]])
        }
        return tokenString
    }
    
    static func onMainThread(_ handler: @escaping () -> ()) {
        DispatchQueue.main.async(execute: handler)
    }

    static func displayError(_ viewController: UIViewController, message: String, withErrorCode errorCode: Int) {
        let actualMessage = "\(message)\n\nError Code: \(errorCode)"
        let alertView = UIAlertController(title: "Error", message: actualMessage, preferredStyle: UIAlertController.Style.alert)
        alertView.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        viewController.present(alertView, animated: true, completion: nil)
    }
    
    static func displayErrorOnMainThread(_ viewController: UIViewController, message: String, withErrorCode errorCode :Int) {
        DispatchQueue.main.async(execute: {
            displayError(viewController, message: message, withErrorCode: errorCode)
        })
    }

    static func setColorForAllLabelsInView(_ color: UIColor, inView view:UIView) {
        for subView in view.subviews {
            if subView is UILabel {
                (subView as! UILabel).textColor = color
            }
            setColorForAllLabelsInView(color, inView: subView)
        }
    }    
    
}
