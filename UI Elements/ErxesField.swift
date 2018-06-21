//
//  ErxesField.swift
//  Erxes.io
//
//  Created by soyombo bat-erdene on 2/20/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit
import IoniconsKit

class ErxesField: UITextField,UITextFieldDelegate {

    
    let iconView = UIImageView()
    var paddingSize = CGFloat()
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        delegate = self
        
        
        createBorder()
    }
    required override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        paddingSize = frame.size.height
        self.font = UIFont.ionicon(of: 14)
        let paddingView = UIView(frame: CGRect(x:0, y:0, width:paddingSize+5, height:paddingSize))
        
        let line = UIView(frame:CGRect(x:paddingSize-1,y:0,width:1,height:paddingSize))
        line.backgroundColor = .gray
        paddingView.addSubview(line)
        
        iconView.contentMode = .scaleAspectFit
        paddingView.addSubview(iconView)
        
        self.leftView = paddingView
        self.leftViewMode = .always
       
        
        createBorder()
    }
    
    func createBorder(){
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height-width, width: self.frame.size.width, height: self.frame.size.height)
        self.layer.borderWidth = 1.0
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
    }
    
    func setIcon(image: UIImage) {
        let imageW = image.size.width
        let imageH = image.size.height
        let w = 20 * imageW / imageH
        iconView.frame = CGRect(x: paddingSize/2-w/2, y: paddingSize/2-10, width: w, height: 20)
        iconView.image = image
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("editing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("end editing")
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
