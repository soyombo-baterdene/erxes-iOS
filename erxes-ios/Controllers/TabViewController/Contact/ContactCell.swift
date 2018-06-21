//
//  ContactCell.swift
//  NMG.CRM
//
//  Created by Soyombo bat-erdene on 6/13/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {


    var topLabel: UILabel!
    var bottomLabel: UILabel!
    var icon: UIImageView!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        
        self.selectionStyle = .none
        
        topLabel = UILabel()
        topLabel.textAlignment = .right
        topLabel.textColor = Constants.ERXES_COLOR
        topLabel.font = Constants.LIGHT
        contentView.addSubview(topLabel)
        
        bottomLabel = UILabel()
        bottomLabel.textAlignment = .right
        bottomLabel.textColor = Constants.TEXT_COLOR
        bottomLabel.font = Constants.LIGHT
        contentView.addSubview(bottomLabel)
        
    
        
        icon = UIImageView()
        
//        icon.image = icon.image!.withRenderingMode(.alwaysTemplate)
        icon.tintColor = Constants.ERXES_COLOR
        contentView.addSubview(icon)
        self.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        icon.snp.makeConstraints { (make) in
            make.left.equalTo(contentView.snp.left).inset(10)
            make.width.height.equalTo(15)
            make.centerY.equalTo(contentView.snp.centerY)
            
        }
        
        topLabel.snp.makeConstraints { (make) in
            make.left.equalTo(icon.snp.right).offset(10)
            make.top.equalTo(contentView.snp.top).offset(5)
//            make.height.equalTo(20)
        }
        
        bottomLabel.snp.makeConstraints { (make) in
            make.left.equalTo(icon.snp.right).offset(10)
            make.bottom.equalTo(contentView.snp.bottom).inset(5)
//            make.height.equalTo(20)
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
