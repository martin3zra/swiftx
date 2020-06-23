//
//  UITextView.swift
//  SwiftX
//
//  https://github.com/bhlvoong/LBTATools/blob/master/Source/Extensions/UITextView.swift
//  Created by Alfredo Martinez on 6/23/20.
//

import Foundation

import UIKit

@available(iOS 11.0, tvOS 11.0, *)
extension UITextView {
    convenience public init(
        text: String? = nil,
        font: UIFont? = UIFont.systemFont(ofSize: 14),
        textColor: UIColor = .black,
        textAlignment: NSTextAlignment = .left
    ) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
    }
}
