import UIKit

public extension UIView {

    public func fadeIn(duration: Double = 0.3) {
        UIView.animateWithDuration(duration, animations: {
            self.alpha = 1
        })
    }
    
    public func fadeOut(duration: Double = 0.3) {
        UIView.animateWithDuration(duration, animations: {
            self.alpha = 0
        })
    }

}
