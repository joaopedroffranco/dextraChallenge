//
//  ImageView.swift
//  NeoTruck
//
//  Created by Marcos Kobuchi on 9/15/16.
//  Copyright © 2016 neotruck. All rights reserved.
//

import UIKit

@IBDesignable public class ImageView: UIImageView {
    
    /* Border settings */
    @IBInspectable public var borderColor:UIColor? {
        didSet {
            layer.borderColor = borderColor!.cgColor
        }
    }
    @IBInspectable public var borderWidth:CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    /* Shadow settings */
    @IBInspectable public var shadowOpacity:Float = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }
    @IBInspectable public var shadowColor:UIColor? {
        didSet {
            layer.shadowColor = shadowColor?.cgColor
        }
    }
    @IBInspectable public var shadowRadius:CGFloat = 0.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    @IBInspectable public var shadowOffset:CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    /* Corner Radius. */
    @IBInspectable public var cornerRadius:CGFloat = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    
    func animate(withDuration duration: TimeInterval, from:CGFloat, to:CGFloat, completion: ((Bool) -> Void)? = nil) {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        layer.cornerRadius = to
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.fromValue = from
        animation.toValue = to
        animation.duration = duration
        
        layer.add(animation, forKey: "cornerRadius")
        
        
        let a = DispatchTime.now() + Double(Int64(duration * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: a, execute: {
            completion?(false)
        })
        
        
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = (cornerRadius > 1) ? cornerRadius : cornerRadius * bounds.height
        
        
        
        //        if (shadowOpacity != 0) {
        //
        //            let path = UIBezierPath(rect: CGRect(x: -50, y: 0, width: bounds.width, height: bounds.height))
        //            layer.shadowPath = path.cgPath
        //        }
    }
    
}
