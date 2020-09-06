//
//  File.swift
//  
//
//  Created by Alfredo Martinez on 9/5/20.
//

import UIKit

extension UIEdgeInsets {

    static public func allSides(_ side: CGFloat) -> UIEdgeInsets {
        .init(top: side, left: side, bottom: side, right: side)
    }

}
