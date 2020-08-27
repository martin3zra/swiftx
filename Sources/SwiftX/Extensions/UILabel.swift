//
//  UILabel.swift
//  SwiftX
//
//  https://github.com/bhlvoong/LBTATools/blob/master/Source/Extensions/UILabel.swift
//  Created by Alfredo Martinez on 6/23/20.
//

import UIKit

@available(iOS 11.0, tvOS 11.0, *)
extension UILabel {
    convenience public init(
        text: String? = nil,
        font: UIFont? = UIFont.systemFont(ofSize: 14),
        textColor: UIColor = .black,
        textAlignment: NSTextAlignment = .left,
        numberOfLines: Int = 1
    ) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
}
