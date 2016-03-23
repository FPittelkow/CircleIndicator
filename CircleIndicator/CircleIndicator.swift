//
//  AppDelegate.swift
//  CircleIndicator
//
//  Created by Friedrich Pittelkow on 22.03.16.
//  Copyright © 2016 Friedrich Pittelkow. All rights reserved.
//

import Cocoa

class CircleIndicatorView: NSView {
    
    var currentValue : CGFloat = 0;
    var styleKit = StyleKit()
    
    override func drawRect(dirtyRect: NSRect) {
        styleKit.drawCircleIndicator(value: currentValue)
    }
}