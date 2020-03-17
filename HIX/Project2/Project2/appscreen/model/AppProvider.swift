//
//  AppProvider.swift
//  Project2
//
//  Created by admin on 26/02/20.
//  Copyright © 2020 Dassault Systemes. All rights reserved.
//

import UIKit

class AppProvider: NSObject {

    func getApps() -> [AppModel]{
        var apps : [AppModel] = []
        
        let app1 = AppModel()
        app1.icon = UIImage(named: "home")
        app1.name = "App 1"
        app1.price = 10.0
        apps.append(app1)
        
        let app2 = AppModel()
        app2.icon = UIImage(named: "gallery")
        app2.name = "App 2"
        app2.price = 20.0
        apps.append(app2)
        
        let app3 = AppModel()
        app3.icon = UIImage(named: "apps")
        app3.name = "App 3"
        app3.price = 30.0
        apps.append(app3)
        
        let app4 = AppModel()
        app4.icon = UIImage(named: "apps")
        app4.name = "App 5"
        app4.price = 30.0
        apps.append(app4)
        
        let app5 = AppModel()
        app5.icon = UIImage(named: "apps")
        app5.name = "App 5"
        app5.price = 30.0
        apps.append(app5)
        
        let app6 = AppModel()
        app6.icon = UIImage(named: "apps")
        app6.name = "App 6"
        app6.price = 30.0
        apps.append(app6)
        
        let app7 = AppModel()
        app7.icon = UIImage(named: "apps")
        app7.name = "App 7"
        app7.price = 30.0
        apps.append(app7)
        
        let app8 = AppModel()
        app8.icon = UIImage(named: "apps")
        app8.name = "App 8"
        app8.price = 30.0
        apps.append(app8)
        
        let app9 = AppModel()
        app9.icon = UIImage(named: "apps")
        app9.name = "App 7"
        app9.price = 30.0
        apps.append(app9)
        
        let app10 = AppModel()
        app10.icon = UIImage(named: "apps")
        app10.name = "App 8"
        app10.price = 30.0
        apps.append(app10)
        
        let app11 = AppModel()
        app11.icon = UIImage(named: "apps")
        app11.name = "App 11"
        app11.price = 30.0
        apps.append(app11)
        
        let app12 = AppModel()
        app12.icon = UIImage(named: "apps")
        app12.name = "App 12"
        app12.price = 30.0
        apps.append(app12)
        
        
        return apps
    }

    func getCategories() -> [CategoryModel]{
        var categories : [CategoryModel] = []
        
        let category1 = CategoryModel()
        category1.title = "Games"
        category1.icon = UIImage(named: "home")
        category1.isExpand = true
        category1.apps = []
        
        let app1 = AppModel()
        app1.icon = UIImage(named: "home")
        app1.name = "App 1"
        app1.price = 10.0
        category1.apps!.append(app1)
        
        let app2 = AppModel()
        app2.icon = UIImage(named: "gallery")
        app2.name = "App 2"
        app2.price = 20.0
        category1.apps!.append(app2)
        
        let app3 = AppModel()
        app3.icon = UIImage(named: "apps")
        app3.name = "App 3"
        app3.price = 30.0
        category1.apps!.append(app3)
        
        categories.append(category1)
        
        let category2 = CategoryModel()
        category2.title = "Consumer"
        category2.icon = UIImage(named: "apps")
        category2.isExpand = false
        category2.apps = []
        
        let app4 = AppModel()
        app4.icon = UIImage(named: "home")
        app4.name = "App 4"
        app4.price = 10.0
        category2.apps!.append(app4)
        
        categories.append(category2)
        
        let category3 = CategoryModel()
        category3.title = "Business"
        category3.icon = UIImage(named: "gallery")
        category3.isExpand = false
        category3.apps = []
        
        let app5 = AppModel()
        app5.icon = UIImage(named: "home")
        app5.name = "App 5"
        app5.price = 10.0
        category3.apps!.append(app5)
        
        let app6 = AppModel()
        app6.icon = UIImage(named: "gallery")
        app6.name = "App 6"
        app6.price = 10.0
        category3.apps!.append(app6)
        
        categories.append(category3)
        
        
        return categories
    }
}
