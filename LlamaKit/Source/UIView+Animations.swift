import UIKit

public extension UIView {

    func fadeIn(_ duration: Double = 0.3) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        })
    }
    
    func fadeOut(_ duration: Double = 0.3) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        })
    }

}
