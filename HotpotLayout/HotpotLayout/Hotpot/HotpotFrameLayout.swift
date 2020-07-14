//
//  HotpotFrameLayout.swift
//  HotpotLayout
//
//  Created by R0uter on 2018/4/1.
//  Copyright © 2018 R0uter. All rights reserved.
//

import UIKit

enum HotpotKey:Int {
    case `default` = 0, left, right, width, centerX, top, bottom, height, centerY
}
enum HotpotFrameLayoutDirection:Int {
    case horizontal = 0, vertical
}
class HotpotFrameLayout {
    public var view:UIView
    var key = HotpotKey.default
    
    var direction:HotpotFrameLayoutDirection = .horizontal
    var layoutHorizontal:[HotpotKey:CGFloat] = [:]
    var layoutVertical:[HotpotKey:CGFloat] = [:]
    
    var frameWidth:CGFloat = -0.1
    var frameHeight:CGFloat = -0.1
    var frameLeft:CGFloat = 0
    var frameRight:CGFloat = 0
    var frameTop:CGFloat = 0
    var frameBottom:CGFloat = 0
    var frameCenterX:CGFloat = -0.1
    var frameCenterY:CGFloat = -0.1
    
    init(view:UIView) {
        self.view = view
    }
    
    @discardableResult public func equal(to value:CGFloat) ->HotpotFrameLayout {
        switch direction {
        case .horizontal:
            layoutHorizontal[key] = value
        case .vertical:
            layoutVertical[key] = value
        }
        return self
    }
    
    @discardableResult public func offset(_ value:CGFloat) ->HotpotFrameLayout {
        switch direction {
        case .horizontal:
            layoutHorizontal[key]! += value
        case .vertical:
            layoutVertical[key]! += value
        }
        return self
    }
    
    func render() {
        // Get view default size info.
//        view.sizeToFit()
        
        let left:CGFloat! = layoutHorizontal[.left]
        let right:CGFloat! = layoutHorizontal[.right]
        let width:CGFloat! = layoutHorizontal[.width]
        let centerX:CGFloat! = layoutHorizontal[.centerX]
        
        let top:CGFloat! = layoutVertical[.top]
        let bottom:CGFloat! = layoutVertical[.bottom]
        let height:CGFloat! = layoutVertical[.height]
        let centerY:CGFloat! = layoutVertical[.centerY]
        
        if left != nil {
            // left width right
            // √    -     -
            frameLeft = left
            if width != nil {
                frameWidth = width
                
            } else if right != nil {
                // left width right
                // √    x     √
                frameWidth = right - left
            } else {
                // warn!
            }
            
            
        } else if width != nil {
            // left width right
            // x    √     -
            frameWidth = width
            if right != nil {
                // left width right
                // x    √     √
                frameLeft = right - width
            } else {
                // Warn!
            }
            
            
        } else if right != nil {
            frameLeft = right - view.width
        }
        
        
        if top != nil {
            // top height bottom
            // √    -     -
            frameTop = top
            if height != nil {
                // top height bottom
                // √    √     -
                frameHeight = height
            } else if bottom != nil {
                // top height bottom
                // √    x     √
                frameHeight = bottom - top
            } else {
                // Warn!
            }
            
            
            
        } else if height != nil {
            // top height bottom
            // x    √     -
            frameHeight = height
            if bottom != nil {
                // top height bottom
                // x    √     √
                frameTop = bottom - height
            } else {
                // Warn!
            }
        } else if bottom != nil {
            frameTop = bottom - view.height
        }
        
        
        view.frame = CGRect(x: frameLeft, y: frameTop,
                            width: frameWidth > 0 ? frameWidth : view.width,
                            height: frameHeight > 0 ? frameHeight : view.height)
        
        if centerX != nil {
            view.centerX = centerX
        }
        if centerY != nil {
            view.centerY = centerY
        }
        
    }
    
}
extension HotpotFrameLayout {
    public var width:HotpotFrameLayout {
        key = .width
        direction = .horizontal
        return self
    }
    public var height:HotpotFrameLayout {
        key = .height
        direction = .vertical
        return self
    }
    public var left:HotpotFrameLayout {
        key = .left
        direction = .horizontal
        return self
    }
    public var right:HotpotFrameLayout {
        key = .right
        direction = .horizontal
        return self
    }
    public var top:HotpotFrameLayout {
        key = .top
        direction = .vertical
        return self
    }
    public var bottom:HotpotFrameLayout {
        key = .bottom
        direction = .vertical
        return self
    }
    public var centerX:HotpotFrameLayout {
        key = .centerX
        direction = .horizontal
        return self
    }
    public var centerY:HotpotFrameLayout {
        key = .centerY
        direction = .vertical
        return self
    }
    
}
