//
//  YJHighlightButton.swift
//  YJHighlightButton
//
//  Created by Jet on 16/9/6.
//  Copyright © 2016年 Jet. All rights reserved.
//

import UIKit

class YJHighlightButton: UIButton {
    
    var isHighlightOverlayEnabled: Bool = true {
        didSet {
            if !isHighlightOverlayEnabled {
                highlightOverlayView.removeFromSuperview()
            }
        }
    }
    
    private lazy var highlightOverlayView: UIView! = {
        let view = UIView()
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.5)
        view.isHidden = true
        self.addSubview(view)
        return view
    }()

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        
        if isTouchInside && isHighlightOverlayEnabled {
            
            highlightOverlayView.isHidden = false
            highlightOverlayView.alpha = 1
            highlightOverlayView.frame = self.bounds
            
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
                            self.highlightOverlayView.alpha = 0
                }, completion: nil)
        }
    }
}
