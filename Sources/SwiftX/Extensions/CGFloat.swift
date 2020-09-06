//
//  File.swift
//  
//
//  Created by Alfredo Martinez on 9/5/20.
//

import UIKit

extension CGFloat {

    public static var padding: UIEdgeInsets {
        guard let keyWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else {
            return .init(top: 0, left: 0, bottom: 0, right: 0)
        }

        return keyWindow.safeAreaInsets
    }

    public static  func multiplier(by value: CGFloat, of: CGFloat) -> CGFloat {
        of * value
    }
}

