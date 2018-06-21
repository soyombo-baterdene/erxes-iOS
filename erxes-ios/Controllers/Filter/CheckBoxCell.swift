//
//  CheckBoxCell.swift
//  NMG.CRM
//
//  Created by Soyombo bat-erdene on 6/11/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit

class CheckBoxCell: UITableViewCell {

    var checkButton: GDCheckbox!
    var desc: UILabel!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        
        self.selectionStyle = .none
        
        
            checkButton = GDCheckbox()
            checkButton.checkColor = Constants.ERXES_COLOR
            checkButton.checkWidth = 2.0
            checkButton.containerColor = Constants.ERXES_COLOR
            checkButton.containerWidth = 2.0
            checkButton.isCircular = false
            checkButton.isOn = false
            checkButton.isRadiobox = false
            checkButton.isSquare = false
            checkButton.shouldAnimate = true
            checkButton.shouldFillContainer = false
            checkButton.isEnabled = false
//            button.addTarget(self, action: #selector(onCheckBoxPress(_:)), for: .touchUpInside)
             contentView.addSubview(checkButton)
        
        
        
        desc = UILabel()
        desc.textAlignment = .left
        desc.textColor = Constants.TEXT_COLOR
        desc.font = Constants.LIGHT
        contentView.addSubview(desc)
        
        
        
        
        
        self.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        
        
        checkButton.snp.makeConstraints { (make) in
//            make.left.equalTo(desc.snp.right).offset(10)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.right.equalTo(contentView.snp.right).inset(16)
            make.height.width.equalTo(20)
            
        }
        
        desc.snp.makeConstraints { (make) in
            make.left.equalTo(contentView.snp.left).offset(16)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.right.equalTo(checkButton.snp.right).offset(10)
            make.height.equalTo(20)
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
