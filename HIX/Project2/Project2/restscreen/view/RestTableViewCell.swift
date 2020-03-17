//
//  RestTableViewCell.swift
//  Project2
//
//  Created by admin on 28/02/20.
//  Copyright © 2020 Dassault Systemes. All rights reserved.
//

import UIKit

class RestTableViewCell: UITableViewCell {
    var fundedLabel : UILabel?
    var fLabel : UILabel?
    var goalLabel : UILabel?
    var daysLabel : UILabel?
    var backgroundImageView : UIImageView?
    var sectRect : UILabel?
    var splRect : UILabel?
    var splRectLabelHd : UILabel?
    var splRectLabelDes : UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 10, width: 400, height: 150))
        backgroundImageView?.contentMode = .scaleToFill
        addSubview(backgroundImageView!)

        sectRect = UILabel(frame: CGRect(x:0,y:150,width:400, height:75))
        sectRect?.backgroundColor = UIColor.cyan
        addSubview(sectRect!)
        
//        splRect = UILabel(frame: CGRect(x:10,y:120,width:300, height:55))
//        splRect?.backgroundColor = UIColor.white
//        addSubview(splRect!)
        
        //splRectLabelHd = UILabel(frame: CGRect(x: 20, y: 125, width: 300, height: 25))
        splRectLabelHd = UILabel(frame: CGRect(x: 10, y: 5, width: 300, height: 25))
        splRectLabelHd?.font = UIFont.boldSystemFont(ofSize: 15.0)
        //addSubview(splRectLabelHd!)
        
        //splRectLabelDes = UILabel(frame: CGRect(x: 20, y: 140, width: 300, height: 35))
        splRectLabelDes = UILabel(frame: CGRect(x: 10, y: 20, width: 300, height: 35))
        splRectLabelDes?.font = UIFont.boldSystemFont(ofSize: 12.0)
        //addSubview(splRectLabelDes!)
        
        //Using a sub section view
        var sectTitleView = UIView(frame: CGRect(x:10,y:120,width:300, height:55))
        sectTitleView.backgroundColor = UIColor.white
        sectTitleView.layer.cornerRadius = 20
        sectTitleView.clipsToBounds = true
        addSubview(sectTitleView)
        sectTitleView.addSubview(splRectLabelHd!)
        sectTitleView.addSubview(splRectLabelDes!)
        
        
        
        fundedLabel = UILabel(frame: CGRect(x: 10, y: 180, width: 100, height: 25))
        fundedLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
        fundedLabel?.textColor = UIColor.red
        addSubview(fundedLabel!)
        
        fLabel = UILabel(frame: CGRect(x: 10, y: 200, width: 100, height: 25))
        fLabel?.text = "FUNDED"
        fLabel?.font = UIFont.boldSystemFont(ofSize: 12.0)
        fLabel?.textColor = UIColor.white
        addSubview(fLabel!)
        
        goalLabel = UILabel(frame: CGRect(x: 120, y: 180, width: 100, height: 25))
        goalLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
        goalLabel?.textColor = UIColor.red
        addSubview(goalLabel!)
        
        fLabel = UILabel(frame: CGRect(x: 120, y: 200, width: 100, height: 25))
        fLabel?.text = "GOAL"
        fLabel?.font = UIFont.boldSystemFont(ofSize: 12.0)
        fLabel?.textColor = UIColor.white
        addSubview(fLabel!)
        
        daysLabel = UILabel(frame: CGRect(x: 230, y: 180, width: 70, height: 25))
        addSubview(daysLabel!)
        
        fLabel = UILabel(frame: CGRect(x: 230, y: 200, width: 100, height: 25))
        fLabel?.text = "ENDS IN"
        fLabel?.font = UIFont.boldSystemFont(ofSize: 12.0)
        fLabel?.textColor = UIColor.white
        addSubview(fLabel!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
