//
//  CentralLoadingIndicator.swift
//  LlamaKit
//
//  Created by Adam Cooke on 09/10/2015.
//
//

import UIKit

public class CentralLoadingIndicator : UIView {
    
    public var activityIndicator : UIActivityIndicatorView!
    public var textLabel : UILabel!
    
    public convenience init(sizedWithinView view: UIView) {
        let frame = CGRect(x: (view.bounds.width / 2) - 60, y: 120, width: 120, height: 95)
        self.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.5)
        self.layer.cornerRadius = 10
        
        // Create a default activity indicator
        self.activityIndicator = UIActivityIndicatorView(frame: CGRect(x: (self.bounds.width / 2) - 7, y: 30, width: 15, height: 15))
        activityIndicator.startAnimating()
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        self.addSubview(activityIndicator)
        
        // Create a default loading
        self.textLabel = UILabel(frame: CGRect(x: 0, y: 62, width: self.bounds.width, height: 15))
        textLabel.text = "Loading..."
        textLabel.textColor = UIColor.whiteColor()
        textLabel.textAlignment = NSTextAlignment.Center
        textLabel.font = UIFont.systemFontOfSize(13.0, weight: UIFontWeightMedium)
        self.addSubview(textLabel)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func stopDisplaying() {
        UIView.animateWithDuration(0.2, animations: {
            self.alpha = 0
            self.transform = CGAffineTransformMakeScale(1.2, 1.2)
        }) {
            finished in
            if finished {
                self.removeFromSuperview()
                self.alpha = 1
            }
        }
    }
    
}
