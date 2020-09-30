//
//  VSpacer.swift
//  
//
//  Created by Alfredo Martinez on 9/29/20.
//

#if !os(macOS)
import UIKit

@available(iOS 11.1, tvOS 11.0, *)
public class VSpacer: UIView {
    public init(padding value: CGFloat = 1) {
        super.init(frame: .zero)

        withHeight(value)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
#endif
