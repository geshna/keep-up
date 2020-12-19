//
//  FillBubble.swift
//  Keep Up
//
//  Created by Lisa Tang on 12/19/20.
//
/*
import Foundation
import UIKit
/*
class FillBubble: UIButton {
    let checkedImage = UIImage(named: "circle")! as UIImage
    let uncheckedImage = UIImage(named:"circle.fill")! as UIImage
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
                self.isEnabled = true
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
                self.isEnabled = true
            }
            
        }
    }
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }

    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
 */*/
