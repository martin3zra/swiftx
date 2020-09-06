//
//  File.swift
//  
//
//  Created by Alfredo Martinez on 9/5/20.
//

import UIKit

extension UIImageView {
    convenience public init(image: UIImage?, contentMode: UIView.ContentMode = .scaleAspectFill) {
        self.init(image: image)
        self.contentMode = contentMode
        self.clipsToBounds = true
    }
}
