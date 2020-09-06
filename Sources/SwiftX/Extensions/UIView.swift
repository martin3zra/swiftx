//
//  File.swift
//  
//
//  Created by Alfredo Martinez on 9/5/20.
//

import UIKit

extension UIView {


    open func add(_ views :UIView...) {
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
