//
//  MyTextField.swift
//  NMG.CRM
//
//  Created by soyombo bat-erdene on 4/6/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit

class MyTextField: UITextField, UITextFieldDelegate {


    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        delegate = self

    }
    required override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        
        
        let paddingView = UIView(frame: CGRect(x:0, y:0, width:10, height:frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor(red: 103/255, green: 63/255, blue: 189/255, alpha: 1.0)
        self.textColor = .white
        self.font = Constants.LIGHT
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
