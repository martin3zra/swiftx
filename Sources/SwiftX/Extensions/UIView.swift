//
//  File.swift
//  
//
//  Created by Alfredo Martinez on 9/5/20.
//
#if !os(macOS)
import UIKit

@available(iOS 11.0, tvOS 11.0, *)
extension UIView {
    
    public func add(_ views :UIView...) {
        views.forEach({addSubview($0)})
    }

    convenience public init(backgroundColor: UIColor = .clear, cornerRadius: CGFloat = 0) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor

        if cornerRadius > 0 {
            layer.cornerRadius = cornerRadius
        }
    }
}
#endif
