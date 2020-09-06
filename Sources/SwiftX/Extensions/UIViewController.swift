//
//  File.swift
//  
//
//  Created by Alfredo Martinez on 9/5/20.
//

import UIKit

extension UIViewController {

    func add(_ child: UIViewController, _ viewHolder: UIView? = nil) {

        addChild(child)

        if viewHolder != nil {
            viewHolder?.addSubview(child.view)
        } else {
            view.addSubview(child.view)
        }

        child.didMove(toParent: self)
    }

    func remove() {

        guard self.parent != nil else { return }

        willMove(toParent: nil)
        removeFromParent()

        view.removeFromSuperview()
    }
}

