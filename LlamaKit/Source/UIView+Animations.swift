import UIKit

public extension UIView {

    public func fadeIn(_ duration: Double = 0.3) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        })
    }
    
    public func fadeOut(_ duration: Double = 0.3) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        })
    }

}
