//
//  AnchoredConstraints.swift
//  SwiftX
//  
//  https://github.com/bhlvoong/LBTATools/blob/master/Source/AnchoredConstraints.swift
//  Created by Alfredo Martinez on 8/27/20.
//
#if !os(macOS)
import UIKit

@available(iOS 11.0, tvOS 11.0, *)
public struct AnchoredConstraints {

    public var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}
#endif
