//
//  ViewController.swift
//  Calculator
//
//  Created by John Monnett on 15/08/2017.
//  Copyright © 2017 John Monnett. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var display: UILabel!
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "π": displayValue = Double.pi
            case "√": displayValue = sqrt(displayValue)
            default: break
            }
        }
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    
    
    
}
