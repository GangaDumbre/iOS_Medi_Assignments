//
//  ViewController.swift
//  Project2
//
//  Created by admin on 26/02/20.
//  Copyright © 2020 Dassault Systemes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageView : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        edgesForExtendedLayout = UIRectEdge()//shift origin
        
        
        imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 365, height: 545))
        imageView?.image = UIImage(named: "medi_home.JPG")
        
        view.addSubview(imageView!)
        
    }


}

