//
//  ErxesUser.swift
//  erxes
//
//  Created by soyombo bat-erdene on 2/24/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit


class ErxesUser
{

    private static var info: ErxesUser?
    
    class func sharedUserInfo() -> ErxesUser
    {
        if self.info == nil
        {
            self.info = ErxesUser()
        }
        
        return self.info!
    }

    var _id:String?
    var username: String?
    var email: String?
    var role: String?
    var emailSignatures:[[String:Any]]?
    var getNotificationByEmail:Bool?
    var avatar:String?
    var fullName:String?
    var position:String?
    var twitterUsername:String?
    var token:String?
    var refreshToken:String?
}
