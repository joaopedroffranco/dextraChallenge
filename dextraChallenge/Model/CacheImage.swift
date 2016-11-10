//
//  CacheImage.swift
//  dextraChallenge
//
//  Created by Joao Pedro Fabiano Franco on 10/11/16.
//  Copyright © 2016 joaopedroffranco. All rights reserved.
//

import UIKit

class CacheImage {
    static let sharedInstance = CacheImage()
    
    private var cache: [String : UIImage] = [:]

    func image(_ url:String?, completion: @escaping (_ error: Error?, _ image: UIImage?)->()) -> (UIImage?, URLSessionDataTask?) {
        var img: UIImage?
        var session: URLSessionDataTask?
        
        if let imageURL = url {
            if let image = cache[imageURL] {
                img = image
                completion(nil, img)
            } else {
                let imagePath = imageURL
                let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
                session = defaultSession.dataTask(with: URL(string: imagePath)!, completionHandler: { (data, response, error) in
                    if error != nil {
                        completion(error as Error?, nil)
                    } else {
                        if let imageData = data {
                            let image = UIImage(data: imageData)
                            self.cache[imageURL] = image
                            img = image
                            completion(nil, img)
                        } else {
                            completion(error, nil)
                        }
                    }
                })
                
                session!.resume()
            }
            
        } else {
            completion(nil, nil)
        }
        
        return (nil, session)
    }
}
