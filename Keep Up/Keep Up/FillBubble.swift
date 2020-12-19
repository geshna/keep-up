//
//  FillBubble.swift
//  Keep Up
//
//  Created by Lisa Tang on 12/19/20.
//

import Foundation
import UIKit

class FillBubble: UIButton {
    let filledBubble = UIImage(systemName: "circle")! as UIImage
    let unfilledBubble = UIImage(systemName:"circle.fill")! as UIImage
    
    var isFilled: Bool = false {
        didSet {
            if isFilled == true {
                self.setImage(filledBubble, for: UIControl.State.normal)
                self.isEnabled = true
            } else {
                self.setImage(unfilledBubble, for: UIControl.State.normal)
                self.isEnabled = true
            }
            
        }
    }
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isFilled = false
    }

    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isFilled = !isFilled
        }
    }
}

