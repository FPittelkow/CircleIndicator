//
//  AppDelegate.swift
//  CircleIndicator
//
//  Created by Friedrich Pittelkow on 22.03.16.
//  Copyright © 2016 Friedrich Pittelkow. All rights reserved.
//

import Cocoa
import Foundation

public class StyleKit : NSObject {
    
    func drawCircleIndicator(value value: CGFloat = 0.274) {
        //// General Declarations
        let context = NSGraphicsContext.currentContext()!.CGContext

        //// Color Declarations
        let fGColour = NSColor(calibratedRed: 0.8, green: 0.322, blue: 0.322, alpha: 1)
        let bGColour = NSColor(calibratedRed: 0.471, green: 0.322, blue: 0.322, alpha: 1)

        //// Variable Declarations
        let expression: CGFloat = value * 360

        //// BG Drawing
        NSGraphicsContext.saveGraphicsState()
        CGContextTranslateCTM(context, 275, 25)
        CGContextRotateCTM(context, 90 * CGFloat(M_PI) / 180)

        let bGPath = NSBezierPath(ovalInRect: NSMakeRect(0, 0, 250, 250))
        bGColour.setStroke()
        bGPath.lineWidth = 50
        bGPath.stroke()

        NSGraphicsContext.restoreGraphicsState()


        //// FG Drawing
        NSGraphicsContext.saveGraphicsState()
        CGContextTranslateCTM(context, 275, 25)
        CGContextRotateCTM(context, 90 * CGFloat(M_PI) / 180)

        let fGRect = NSMakeRect(0, 0, 250, 250)
        let fGPath = NSBezierPath()
        fGPath.appendBezierPathWithArcWithCenter(NSMakePoint(fGRect.midX, fGRect.midY), radius: fGRect.width / 2, startAngle: expression, endAngle: 0, clockwise: true)

        fGColour.setStroke()
        fGPath.lineWidth = 50
        fGPath.stroke()

        NSGraphicsContext.restoreGraphicsState()
    }
}

@objc protocol StyleKitSettableImage {
    func setImage(image: NSImage!)
}

@objc protocol StyleKitSettableSelectedImage {
    func setSelectedImage(image: NSImage!)
}
