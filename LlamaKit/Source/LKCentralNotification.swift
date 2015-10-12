// This will display a nice looking notification when an action has been
// either successfully or not successfully complete.


public class LKCentralNotification : UIView {
    
    var effectView : UIView!
    var imageView : UIImageView!
    var textView : UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.layer.shadowOffset = CGSizeMake(0, 0)
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 10.0
        self.clipsToBounds = true
        self.addEffectView()
        self.addImageView()
        self.addTextView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //
    // Insert the text view
    //
    func addEffectView() {
        self.effectView = UIView(frame:CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.effectView.backgroundColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.6)
        self.addSubview(effectView)
    }
    
    //
    // Add the base text view
    //
    func addTextView() {
        self.textView = UITextView()
        textView.backgroundColor = UIColor.clearColor()
        textView.textAlignment = NSTextAlignment.Center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.editable = false
        textView.textAlignment = NSTextAlignment.Center
        effectView.addSubview(textView)
        effectView.addConstraint(NSLayoutConstraint(item: textView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: imageView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0))
        effectView.addConstraint(NSLayoutConstraint(item: textView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: effectView, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 10))
        effectView.addConstraint(NSLayoutConstraint(item: textView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: effectView, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: -10))
        effectView.addConstraint(NSLayoutConstraint(item: textView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: effectView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -10))
    }
    
    //
    // Set the image which should be displayed
    //
    public func setImage(image:UIImage?) {
        if let image = image {
            imageView.image = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        } else {
            imageView.image = nil
        }
    }
    
    public func setImageWithName(file:String) {
        let path = LKUtils.pathToResource("\(file).png")
        self.setImage(UIImage(contentsOfFile: path))
    }
    
    //
    // Add the image view with the appropriate image at the top of the view/
    //
    func addImageView() {
        self.imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        imageView.tintColor = UIColor.whiteColor()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        effectView.addSubview(imageView)
        effectView.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 60))
        effectView.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 60))
        effectView.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: effectView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        effectView.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: effectView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -20))
    }
    
    
    //
    // Set the text which should be displayed within the view
    //
    public func setText(string:String) {
        let range = NSRange(location: 0, length: string.characters.count)
        let attributedText = NSMutableAttributedString(string:string)
        attributedText.beginEditing()
        let style = NSMutableParagraphStyle()
        style.lineHeightMultiple = 1.2
        style.alignment = NSTextAlignment.Center
        attributedText.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: range)
        attributedText.addAttribute(NSParagraphStyleAttributeName, value: style, range: range)
        attributedText.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFontOfSize(12), range: range)
        attributedText.endEditing()
        textView.attributedText = attributedText
    }
    
}