//
//  ErxesButton.swift
//  Erxes.io
//
//  Created by soyombo bat-erdene on 2/20/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit
import SnapKit

class ErxesButton: UIButton {


    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!

    }
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel?.font = Constants.LIGHT
        self.layer.cornerRadius = 6
        self.addBorder(with: Constants.ERXES_COLOR)

    }
    
    override var isSelected: Bool {
        willSet {
            print("changing from \(isSelected) to \(newValue)")
            if isSelected{
               
            }else{
             
            }
        }
        
        didSet {
            print("changed from \(oldValue) to \(isSelected)")
        }
    }

    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        closeButton.snp.makeConstraints { (make) in
//            make.width.height.equalTo(14)
//            make.left.equalTo(self.snp.right).inset(7)
//            make.bottom.equalTo(self.snp.top).inset(7)
//        }
//    }
}
