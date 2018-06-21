//
//  ErxesLoader.swift
//  NMG.CRM
//
//  Created by Soyombo bat-erdene on 6/15/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit

class ErxesLoader: UIView {

    var lineWidth: CGFloat = 3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addBehavior()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
         self.backgroundColor = .clear

    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func addBehavior() {
     
    }
    
    func rotate360Degrees(duration: CFTimeInterval = 3) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount=Float.infinity
        self.layer.add(rotateAnimation, forKey: nil)
    }

    func startAnimating(){
        self.isHidden = false
        let circle1 = CircleLayer.init(bounds: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.width), position: CGPoint(x: self.frame.size.width/2, y: self.frame.size.width/2), fromColor: Constants.ERXES_COLOR, toColor: .white, linewidth: lineWidth, toValue: 0.32)
        let circle2 = CircleLayer.init(bounds: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.width), position: CGPoint(x: self.frame.size.width/2, y: self.frame.size.width/2), fromColor: UIColor.init(hexString: "e6d2ac")!, toColor: .white, linewidth: lineWidth, toValue: 0.65)
        let circle3 = CircleLayer.init(bounds: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.width), position: CGPoint(x: self.frame.size.width/2, y: self.frame.size.width/2), fromColor: .red, toColor: .white, linewidth: lineWidth, toValue: 0.99)
  
        self.layer.addSublayer(circle1)
        self.layer.addSublayer(circle2)
        self.layer.addSublayer(circle3)
        
        circle1.animateCircleTo(duration: 0, fromValue: 0.0, toValue: 0.32)
        circle2.animateCircleTo(duration: 0, fromValue: 0.33, toValue: 0.65)
        circle3.animateCircleTo(duration: 0, fromValue: 0.66, toValue: 0.99)
        
        self.rotate360Degrees()
        
        if var topController = UIApplication.shared.delegate?.window??.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            let bgview = UIView(frame: topController.view.frame)
            bgview.tag = 1001
            bgview.alpha = 0.25
            bgview.backgroundColor = .white
            topController.view.addSubview(bgview)
        }
    }
    func stopAnimating(){
        self.layer.removeAllAnimations()
        self.isHidden = true
        if var topController = UIApplication.shared.delegate?.window??.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            for subview in topController.view.subviews {
                if subview.tag == 1001{
                    subview.removeFromSuperview()
                }
            }
        }
    }
}
