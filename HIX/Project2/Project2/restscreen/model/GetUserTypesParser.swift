//
//  GetUserTypesParser.swift
//  Project2
//
//  Created by admin on 28/02/20.
//  Copyright © 2020 Dassault Systemes. All rights reserved.
//

//Parser keyword used generic for data parsing

import UIKit

@objc protocol GetUserTypesParserDelegate : NSObjectProtocol { //protocol without NSObjectProtocol can be done, but there will be no checks if the methods are implemented or not
    
    func didReceivedUserTypes(_ userTypes : [UserTypeModel])
    
    @objc optional func didReceivedError()
}

class GetUserTypesParser: NSObject, URLSessionDownloadDelegate {
 
    weak var delegate : GetUserTypesParserDelegate?

    var data : Data?
    
    //closure:  just defins and executes when called using session
    var session : URLSession{//has tasks: Download,..
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 20
        sessionConfig.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        let session1 = URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
        
        return session1
    }
    
    
    func getUserTypes(){
        
        let webUrl : String = "http://test.chatongo.in/testdata.json"
        
        let downloadTask = session.downloadTask(with: URL(string: webUrl)!)
        downloadTask.resume()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        do{
            data = try Data(contentsOf: location)
            let responseString = String(data: data!, encoding: .utf8)
            print("responseString \(responseString!)") //the responseString can be null and hence it will printed as optional in the server, so unwrap it
            
            if let result = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String : Any]{
                let status = result["Status"] as? Int
                if status == 200{
                    let data = result["data"] as? [String: Any]
                    let totalrecords = data!["TotalRecords"] as? Int
                   // for i in 0..<data!.count{
                        let records = data!["Records"] as? [[String:Any]]
                        //let records =  rec!["records"]  as? [[String:Any]]
                        //let records = data?["records"] as? [[String:Any]]
                    
                    var userTypes : [UserTypeModel] = []
                    for i in 0..<records!.count{
                        let userType = UserTypeModel(json: records![i])
                        userTypes.append(userType)
                    }
                    print("count is \(userTypes.count)")
                    //}
                    //send message to the controller using protocol
                    DispatchQueue.main.async {
                        self.delegate?.didReceivedUserTypes(userTypes)
                    }
                    
                } else{
                    if delegate != nil{
                        if delegate!.responds(to: #selector(GetUserTypesParserDelegate.didReceivedError)){ //delegate.responds works only on NSObjectProtocol
                            delegate?.didReceivedError?()
                        }
                    }
                }
            }
            
        }catch{
            if delegate != nil{
                if delegate!.responds(to: #selector(GetUserTypesParserDelegate.didReceivedError)){ //delegate.responds works only on NSObjectProtocol
                    delegate?.didReceivedError?()
                }
            }
        }
     }
}
