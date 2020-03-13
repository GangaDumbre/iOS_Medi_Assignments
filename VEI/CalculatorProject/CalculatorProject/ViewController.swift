//
//  ViewController.swift
//  CalculatorProject
//
//  Created by admin on 11/03/20.
//  Copyright © 2020 Dassault_Systemes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentNumber:Double = 0;
    var previousNumber:Double = 0;
    var performOperation = false;
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performOperation == true {
            label.text = String(sender.tag - 1)
            currentNumber = Double(label.text!)!
            
            performOperation = false
        }
        else{
            label.text = label.text! + String(sender.tag - 1)
            currentNumber = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 17
        {
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12 { //divide
                
                label.text = "/";
                
            } else if sender.tag == 13 { //multiply
                
                label.text = "x";
                
            } else if sender.tag == 14 { //minus
                
                label.text = "-";
                
            } else if sender.tag == 15 { //plus
                
                label.text = "+";
                
            } else if sender.tag == 16 { //dividend
                
                label.text = "%";
            }
            
            operation = sender.tag
            
            performOperation = true;
        }
        else if sender.tag == 17 {
            
            if operation == 12 {
                
                label.text = String (previousNumber / currentNumber)
                
            } else if operation == 13 {
                
                label.text = String (previousNumber * currentNumber)
                
            } else if operation == 14 {
                
                label.text = String (previousNumber - currentNumber)
                
            } else if operation == 15 {
                
                label.text = String (previousNumber + currentNumber)
                
            } else if operation == 16 {
                
                label.text = String(currentNumber / 100.0)
            }
        }
        else if sender.tag == 11 {
            label.text = ""
            previousNumber = 0
            currentNumber = 0
            operation = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

