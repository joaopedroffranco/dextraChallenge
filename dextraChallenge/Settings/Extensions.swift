//
//  Extensions.swift
//  dextraChallenge
//
//  Created by Joao Pedro Fabiano Franco on 10/11/16.
//  Copyright © 2016 joaopedroffranco. All rights reserved.
//

import UIKit

extension UIView {
    
    /** Remove activity indicator on view */
    func removeLoading(){
        for view in self.subviews {
            if view is UIActivityIndicatorView{
                let view = view as! UIActivityIndicatorView
                view.stopAnimating()
                view.removeFromSuperview()
            }
        }
    }

    /** Add activity indicator on view */
    func startLoading(style: UIActivityIndicatorViewStyle){
        removeLoading()
        
        let loading = UIActivityIndicatorView(activityIndicatorStyle: style)
        loading.frame = self.bounds
        loading.startAnimating()
        self.addSubview(loading)
    }
    
    func stopLoading(){
        removeLoading()
    }
    
}

extension String {
    
    /** String without whitespaces */
    var joined: String {
        return components(separatedBy: .whitespaces).joined(separator: "")
    }
    
}
