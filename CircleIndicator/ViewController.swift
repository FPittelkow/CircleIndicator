//
//  AppDelegate.swift
//  CircleIndicator
//
//  Created by Friedrich Pittelkow on 22.03.16.
//  Copyright © 2016 Friedrich Pittelkow. All rights reserved.
//

import Cocoa
import Foundation

class ViewController: NSViewController {
    
    @IBOutlet weak var sldr: NSSlider!
    @IBOutlet weak var circleIndicatorView: CircleIndicatorView!
    @IBOutlet weak var Label: NSTextField!
    
    override func viewDidAppear() {
        self.view.window?.titlebarAppearsTransparent = true
        self.view.window?.movableByWindowBackground = true
    }
    
    override func viewDidLoad() {
        // Set slider to zero postion, redraw canvas, set labe value.
        super.viewDidLoad()
        sldr.integerValue = 0
        setCanvas()
        setPercLabel(sldr.doubleValue)
    }

    func setPercLabel(n: Double) -> Void {
        // Set label to percentage balue with a pattern like "00.0 %
        
        let percValue = round(n * 100)

        if percValue >= 10 {
            Label.stringValue = String("\(percValue) %")
        }
        else {
            Label.stringValue = String("0\(percValue) %")
        }
    }
    
    func setCanvas() {
        // Draw the canvas
        circleIndicatorView.currentValue = CGFloat(sldr.floatValue)
        circleIndicatorView.needsDisplay = true
    }
    
    @IBAction func SldrDidChangeValue(sender: NSSlider) {
        setCanvas()
        setPercLabel(sldr.doubleValue)
    }
    
}