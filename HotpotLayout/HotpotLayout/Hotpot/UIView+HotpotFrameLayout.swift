//
//  UIView+HotpotFrameLayout.swift
//  HotpotLayout
//
//  Created by R0uter on 2018/4/1.
//  Copyright © 2018 R0uter. All rights reserved.
//

import UIKit

extension UIView {
    public var left:CGFloat {
        get {return frame.minX}
        set {frame.origin.x = newValue}
    }
    public var top:CGFloat {
        get {return frame.minY}
        set {frame.origin.y = newValue}
    }
    public var right:CGFloat {
        get {return frame.maxX}
        set {frame.origin.x = newValue - frame.size.width}
    }
    public var bottom:CGFloat {
        get {return frame.maxY}
        set  {frame.origin.y = newValue - frame.size.height}
    }
    public var width:CGFloat {
        get {return frame.width}
        set {frame.size.width = newValue}
    }
    public var height:CGFloat {
        get {return frame.height}
        set {frame.size.height = newValue}
    }
    public var centerX:CGFloat {
        get {return center.x}
        set {center = CGPoint(x: newValue, y: center.y)}
    }
    public var centerY:CGFloat {
        get {return center.y}
        set {center = CGPoint(x: center.x, y: newValue)}
    }
    public var origin:CGPoint {
        get {return frame.origin}
        set {frame.origin = newValue}
    }
    public var size:CGSize {
        get {return frame.size}
        set {frame.size = newValue}
    }
    func frameLayout(_ block:(HotpotFrameLayout)->()) {
        let layout = HotpotFrameLayout(view: self)
        block(layout)
        layout.render()
    }
}
