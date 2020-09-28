//
//  File.swift
//  
//
//  Created by Alfredo Martinez on 9/5/20.
//

#if !os(macOS)
import UIKit

@available(iOS 11.0, tvOS 11.0, *)
extension UIImageView {
    convenience public init(image: UIImage?, contentMode: UIView.ContentMode = .scaleAspectFill) {
        self.init(image: image)
        self.contentMode = contentMode
        self.clipsToBounds = true
    }
}
#endif
