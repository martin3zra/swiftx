//
//  File.swift
//  
//
//  Created by Alfredo Martinez on 9/5/20.
//

#if !os(macOS)
import UIKit

@available(iOS 11.0, tvOS 11.0, *)
extension CGSize {
    static public func equalEdge(_ edge: CGFloat) -> CGSize {
        .init(width: edge, height: edge)
    }
}
#endif
