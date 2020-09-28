//
//  UILabel.swift
//  SwiftX
//
//  https://github.com/bhlvoong/LBTATools/blob/master/Source/Extensions/UILabel.swift
//  Created by Alfredo Martinez on 6/23/20.
//

#if !os(macOS)
import UIKit

@available(iOS 11.0, tvOS 11.0, *)
extension UILabel {
    convenience public init(
        text: String? = nil,
        font: UIFont? = UIFont.systemFont(ofSize: 14),
        textColor: UIColor = .black,
        alignment: NSTextAlignment = .left,
        numberOfLines: Int = 1
    ) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
    }
    
    func outLinedText(_ width: CGFloat = -2.0, _ color: UIColor = .white) {
        let attribute : [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.strokeColor : color,
            NSAttributedString.Key.foregroundColor : self.textColor!,
            NSAttributedString.Key.strokeWidth : width,
            NSAttributedString.Key.font : self.font!
            ] as [NSAttributedString.Key  : Any]
        
        let customizedText = NSMutableAttributedString(string: self.text ?? "",
                                                       attributes: attribute)
        attributedText = customizedText
    }
}
#endif
