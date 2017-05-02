// This will display a nice looking notification when an action has been
// either successfully or not successfully complete.


open class LKCentralNotification : UIView {
    
    var effectView : UIView!
    var imageView : UIImageView!
    var textView : UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor.black.cgColor
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
        textView.backgroundColor = UIColor.clear
        textView.textAlignment = NSTextAlignment.center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.textAlignment = NSTextAlignment.center
        effectView.addSubview(textView)
        effectView.addConstraint(NSLayoutConstraint(item: textView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: imageView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0))
        effectView.addConstraint(NSLayoutConstraint(item: textView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: effectView, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 10))
        effectView.addConstraint(NSLayoutConstraint(item: textView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: effectView, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -10))
        effectView.addConstraint(NSLayoutConstraint(item: textView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: effectView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -10))
    }
    
    //
    // Set the image which should be displayed
    //
    open func setImage(_ image:UIImage?) {
        if let image = image {
            imageView.image = image.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        } else {
            imageView.image = nil
        }
    }
    
    open func setImageWithName(_ file:String) {
        let path = LKUtils.pathToResource("\(file).png")
        self.setImage(UIImage(contentsOfFile: path))
    }
    
    //
    // Add the image view with the appropriate image at the top of the view/
    //
    func addImageView() {
        self.imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        imageView.tintColor = UIColor.white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        effectView.addSubview(imageView)
        effectView.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 60))
        effectView.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 60))
        effectView.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: effectView, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0))
        effectView.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: effectView, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: -20))
    }
    
    
    //
    // Set the text which should be displayed within the view
    //
    open func setText(_ string:String) {
        let range = NSRange(location: 0, length: string.characters.count)
        let attributedText = NSMutableAttributedString(string:string)
        attributedText.beginEditing()
        let style = NSMutableParagraphStyle()
        style.lineHeightMultiple = 1.2
        style.alignment = NSTextAlignment.center
        attributedText.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: range)
        attributedText.addAttribute(NSParagraphStyleAttributeName, value: style, range: range)
        attributedText.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFont(ofSize: 12), range: range)
        attributedText.endEditing()
        textView.attributedText = attributedText
    }
    
}
