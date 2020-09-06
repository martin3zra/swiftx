//
//  File.swift
//  
//
//  Created by Alfredo Martinez on 9/5/20.
//

import UIKit

extension CGSize {
    static public func equalEdge(_ edge: CGFloat) -> CGSize {
        .init(width: edge, height: edge)
    }
}

