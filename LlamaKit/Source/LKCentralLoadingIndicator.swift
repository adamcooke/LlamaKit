//
//  CentralLoadingIndicator.swift
//  LlamaKit
//
//  Created by Adam Cooke on 09/10/2015.
//
//

import UIKit

open class LKCentralLoadingIndicator : UIView {
    
    open var activityIndicator : UIActivityIndicatorView!
    open var textLabel : UILabel!
    
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
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        self.addSubview(activityIndicator)
        
        // Create a default loading
        self.textLabel = UILabel(frame: CGRect(x: 0, y: 62, width: self.bounds.width, height: 15))
        textLabel.text = "Loading..."
        textLabel.textColor = UIColor.white
        textLabel.textAlignment = NSTextAlignment.center
        if #available(iOS 8.2, *) {
            textLabel.font = UIFont.systemFont(ofSize: 13.0, weight: UIFont.Weight.medium)
        } else {
            textLabel.font = UIFont.systemFont(ofSize: 13.0)
        }
        self.addSubview(textLabel)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open func stopDisplaying() {
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0
            self.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
        }, completion: {
            finished in
            if finished {
                self.removeFromSuperview()
                self.alpha = 1
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }) 
    }
    
}
