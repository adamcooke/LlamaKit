//
//  UITableViewCellWithSpinner.swift
//  LlamaKit
//
//  Created by Adam Cooke on 09/10/2015.
//
//

open class UITableViewCellWithSpinner : UITableViewCell {

    open var spinner : UIActivityIndicatorView?
    
    open override func didMoveToSuperview() {
        if self.superview != nil {
            self.insertSpinner()
        }
    }
    
    open func setDetailTextAndHideSpinner(_ newValue: String?) {
        if newValue == nil {
            self.detailTextLabel?.text = " "
        } else {
            self.detailTextLabel?.text = newValue
            self.hideSpinner()
        }
    }
    
    open func insertSpinner() {
        if spinner == nil {
            self.detailTextLabel?.alpha = 0
            self.spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 21, height: 21))
            spinner!.style = UIActivityIndicatorView.Style.gray
            spinner!.startAnimating()
            spinner!.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(spinner!)
            contentView.addConstraint(NSLayoutConstraint(
                item: spinner!,
                attribute: NSLayoutConstraint.Attribute.trailing,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: contentView,
                attribute: NSLayoutConstraint.Attribute.trailing,
                multiplier: 1,
                constant: self.accessoryType == UITableViewCell.AccessoryType.none ? -15 : 0
            ))
            contentView.addConstraint(NSLayoutConstraint(
                item: spinner!,
                attribute: NSLayoutConstraint.Attribute.centerY,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: contentView,
                attribute: NSLayoutConstraint.Attribute.centerY,
                multiplier: 1,
                constant: 0
            ))
        }
    }

    open func hideSpinner() {
        if spinner != nil {
            UIView.animate(withDuration: 0.3, animations: {
                self.spinner?.alpha = 0
                self.detailTextLabel?.alpha = 1
            })
        }
    }

}
