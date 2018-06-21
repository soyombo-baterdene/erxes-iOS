//
//  TagCell.swift
//  NMG.CRM
//
//  Created by Soyombo bat-erdene on 5/21/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit

class TagCell: UITableViewCell {

    var value: UILabel!
    var desc: UILabel!
    var tagView: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        
        self.selectionStyle = .none
        
        tagView = UIImageView()
//        tagView.image = #imageLiteral(resourceName: "ic_tag")
        
        
        contentView.addSubview(tagView)
        
        value = UILabel()
        value.textAlignment = .right
        value.textColor = Constants.TEXT_COLOR
        value.font = Constants.LIGHT
        contentView.addSubview(value)
        
        
        desc = UILabel()
        desc.textAlignment = .left
        desc.textColor = Constants.TEXT_COLOR
        desc.font = Constants.LIGHT
        contentView.addSubview(desc)
        
        
        
        
        
        self.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tagView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView.snp.left).offset(10)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.height.width.equalTo(20)
        }
        
        desc.snp.makeConstraints { (make) in
            make.left.equalTo(tagView.snp.right).offset(10)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.height.equalTo(20)
        }
        
        value.snp.makeConstraints { (make) in
            make.left.equalTo(desc.snp.right).offset(10)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.right.equalTo(contentView.snp.right).inset(10)
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
