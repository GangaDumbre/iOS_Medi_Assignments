//
//  AppTableViewCell.swift
//  Project2
//
//  Created by admin on 26/02/20.
//  Copyright © 2020 Dassault Systemes. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {

    var iconImageView : UIImageView?
    var nameLabel : UILabel?
    var priceLabel : UILabel?
    
    //init implemented to override the default behavior
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 60, height: 60))
        addSubview(iconImageView!)
        
        nameLabel = UILabel(frame: CGRect(x: 80, y: 10, width: 210, height: 25))
        nameLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        nameLabel?.textColor = UIColor.red
        addSubview(nameLabel!)
        
        priceLabel = UILabel(frame: CGRect(x: 80, y: 45, width: 210, height: 25))
        addSubview(priceLabel!)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
