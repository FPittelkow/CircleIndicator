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
    
    @IBOutlet weak var slider: NSSlider!
    @IBOutlet weak var circleIndicatorView: CircleIndicatorView!
    @IBOutlet weak var Label: NSTextField!
    
    override func viewDidAppear() {
        self.view.window?.titlebarAppearsTransparent = true
        self.view.window?.movableByWindowBackground = true
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()

        slider.integerValue = 0
        drawCanvas()
        setPercLabel(slider.doubleValue)
    }

    func setPercLabel(n: Double) -> Void {
        
        let percValue = round(n * 100)

        if percValue >= 10 {
            Label.stringValue = String("\(percValue) %")
        }
        else {
            Label.stringValue = String("0\(percValue) %")
        }
    }
    
    func drawCanvas() {
        // Draw the canvas
        circleIndicatorView.currentValue = CGFloat(slider.floatValue)
        circleIndicatorView.needsDisplay = true
    }
    
    @IBAction func SldrDidChangeValue(sender: NSSlider) {
        drawCanvas()
        setPercLabel(slider.doubleValue)
    }
}