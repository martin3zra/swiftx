//
//  File.swift
//  
//
//  Created by Alfredo Martinez on 9/5/20.
//

#if !os(macOS)
import UIKit

@available(iOS 11.0, tvOS 11.0, *)
extension UIEdgeInsets {

    static public func allSides(_ side: CGFloat) -> UIEdgeInsets {
        .init(top: side, left: side, bottom: side, right: side)
    }
}
#endif
