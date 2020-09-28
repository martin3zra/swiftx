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

    public func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat, withID identifier: String? = nil) {

        let border = UIView()
        border.id = identifier
        border.backgroundColor = color

        switch edge {
        case .top:
            border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
            border.frame = .init(x: 0, y: 0, width: frame.size.width, height: thickness)
        case .bottom:
            border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
            border.frame = .init(x: 0, y: frame.size.height - thickness, width: frame.size.width, height: thickness)
        case .left:
            border.frame = .init(x: 0, y: 0, width: thickness, height: frame.size.height)
            border.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
        case .right:
            border.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
            border.frame = .init(x: frame.size.width - thickness, y: 0, width: thickness, height: frame.size.height)
        default:
            break
        }

        addSubview(border)
    }

    public var id: String? {
        get {
            return self.accessibilityIdentifier
        }
        set {
            self.accessibilityIdentifier = newValue
        }
    }

    public func view(withId id: String) -> UIView? {
        if self.id == id {
            return self
        }
        for view in self.subviews {
            if let view = view.view(withId: id) {
                return view
            }
        }
        return nil
    }
}
#endif
