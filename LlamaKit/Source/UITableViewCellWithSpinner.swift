//
//  UITableViewCellWithSpinner.swift
//  LlamaKit
//
//  Created by Adam Cooke on 09/10/2015.
//
//

public class UITableViewCellWithSpinner : UITableViewCell {

    public var spinner : UIActivityIndicatorView?
    
    public override func didMoveToSuperview() {
        if self.superview != nil {
            self.insertSpinner()
        }
    }
    
    public func setDetailTextAndHideSpinner(newValue: String?) {
        if newValue == nil {
            self.detailTextLabel?.text = " "
        } else {
            self.detailTextLabel?.text = newValue
            self.hideSpinner()
        }
    }
    
    public func insertSpinner() {
        if spinner == nil {
            self.detailTextLabel?.alpha = 0
            self.spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 21, height: 21))
            spinner!.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            spinner!.startAnimating()
            spinner!.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(spinner!)
            contentView.addConstraint(NSLayoutConstraint(
                item: spinner!,
                attribute: NSLayoutAttribute.Trailing,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Trailing,
                multiplier: 1,
                constant: self.accessoryType == UITableViewCellAccessoryType.None ? -15 : 0
            ))
            contentView.addConstraint(NSLayoutConstraint(
                item: spinner!,
                attribute: NSLayoutAttribute.CenterY,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.CenterY,
                multiplier: 1,
                constant: 0
            ))
        }
    }

    public func hideSpinner() {
        if spinner != nil {
            UIView.animateWithDuration(0.3, animations: {
                self.spinner?.alpha = 0
                self.detailTextLabel?.alpha = 1
            })
        }
    }

}
