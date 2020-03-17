//
//  RestDemoViewController.swift
//  Project2
//
//  Created by admin on 28/02/20.
//  Copyright © 2020 Dassault Systemes. All rights reserved.
//
/*
 Rules to retrieve data from server
    1. create an agent class
    2. Implement the agent purpose
        2.1 Get data from server
        2.2 Process the data
    3. Create a container (optional)
    4. Create pure model class or classes (optional)
    5. Implement feedback mechanism
 */

import UIKit

class RestDemoViewController: UIViewController,GetUserTypesParserDelegate, UITableViewDelegate, UITableViewDataSource, ImageLoaderDelegate {
   
    var tableOfName : UITableView?
    var apps : [UserTypeModel]?


    var parser : GetUserTypesParser?

    override func viewDidLoad() {
        super.viewDidLoad()

        //view.backgroundColor = UIColor.white
        //edgesForExtendedLayout = UIRectEdge()
        
        parser = GetUserTypesParser()
        parser?.delegate = self
        parser?.getUserTypes()
        // Do any additional setup after loading the view.
    }
    
    func didReceivedUserTypes(_ userTypes: [UserTypeModel]) {
        print("controller count is \(userTypes.count)")
        
        apps = userTypes
        tableOfName = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height-50))
        
        tableOfName?.dataSource = self
        tableOfName?.delegate = self
            
        view.addSubview(tableOfName!)
        
      }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 230.0
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return apps!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : RestTableViewCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? RestTableViewCell   //check if already a cell exists with same identifier and reuse

        if cell == nil {
           cell = RestTableViewCell(style: .default, reuseIdentifier: "cell")
           print("cell == nil \(indexPath.row)")
        }

        //model meets view
        //cell?.textLabel?.text = names![indexPath.row]
        let app = apps![indexPath.row]

        cell?.fundedLabel?.text = "Rs \(app.collectedValue!)"// as! String
        cell?.goalLabel?.text = "Rs \(app.totalValue!)"// as? String
        cell?.daysLabel?.text = "50 days"//"Tax: \(app.Tax!)"
        cell?.splRectLabelHd?.text = app.title
        cell?.splRectLabelDes?.text = app.shortDescription
        if app.mainImage != nil{
            cell?.backgroundImageView?.image = app.mainImage;//UIImage(named: "Child.jpg")//app.mainImage//
        }else{
            if !app.isDownloading{
                app.isDownloading = true
                cell?.backgroundImageView?.image = UIImage(named: "Child.jpg")
                //start downloading
                app.loader = ImageLoader()
                app.loader?.getImage(url: app.mainImageURL!, index: indexPath.row)
                app.loader?.delegate = self
                
            }
        }
        
        
        return cell!
    }
    
    func download(image: UIImage, at index: Int) {
        let app = apps![index]
        app.mainImage = image
        app.loader = nil
        tableOfName!.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
