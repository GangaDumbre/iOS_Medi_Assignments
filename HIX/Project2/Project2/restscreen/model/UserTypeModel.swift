//
//  UserTypeModel.swift
//  Project2
//
//  Created by admin on 28/02/20.
//  Copyright © 2020 Dassault Systemes. All rights reserved.
//

import UIKit

class UserTypeModel: NSObject {
    
    var collectedValue  : Int?
    var totalValue : Int?
    var startDate : String?
    var endDate : String?
   
    var title : String?
    var shortDescription : String?
    var mainImageURL : String?
    var mainImage : UIImage?
    var isDownloading = false
    var loader : ImageLoader?
    
    init(json : [String : Any]) {
        super.init()
        
        collectedValue = json["collectedValue"] as? Int
        totalValue = json["totalValue"] as? Int
        startDate = json["startDate"] as? String
        endDate = json["endDate"] as? String
        mainImageURL = json["mainImageURL"] as? String
        mainImage = UIImage(named: mainImageURL!)
        title = json["title"] as? String
        shortDescription = json["shortDescription"] as? String
    }
}
