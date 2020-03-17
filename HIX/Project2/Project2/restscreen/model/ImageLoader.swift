//
//  ImageLoader.swift
//  Project2
//
//  Created by admin on 29/02/20.
//  Copyright © 2020 Dassault Systemes. All rights reserved.
//

import UIKit

protocol ImageLoaderDelegate : NSObjectProtocol{
    func download(image: UIImage, at index: Int)
}
class ImageLoader: NSObject, URLSessionDelegate, URLSessionDownloadDelegate{


    weak var delegate : ImageLoaderDelegate?
    var index : Int?
    var data : Data?
    
    //closure:  just defins and executes when called using session
    var session : URLSession{//has tasks: Download,..
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 20
        
        let session1 = URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
        
        return session1
    }
    
    func getImage(url: String, index:Int){
        self.index = index
        let downloadTask = session.downloadTask(with: URL(string: url)!)
        downloadTask.resume()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        do{
            data = try Data(contentsOf: location)
            let image = UIImage(data: data!)
            DispatchQueue.main.async {
                self.delegate?.download(image: image!, at: self.index!)
            }
        }catch{
            
        }
    }
    
}
