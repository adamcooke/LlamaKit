// This will display a nice looking notification when an action has been
// either successfully or not successfully complete.

public class LKCentralNotification : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.layer.shadowOffset = CGSizeMake(0, 0)
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 10.0
        self.backgroundColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.9)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public convenience init(sizedWithinView view: UIView) {
        let frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 60)
        self.init(frame: frame)
    }
    
}