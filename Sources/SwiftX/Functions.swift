//
//  Functions.swift
//  
//
//  Created by Alfredo Martinez on 9/9/20.
//

import Foundation

func dispatch(name: NSNotification.Name, object: Any? = nil) {
    NotificationCenter.default.post(name: name, object: object)
}
