//
//  ViewController.swift
//  Calculator
//
//  Created by admin on 11/03/20.
//  Copyright © 2020 Dassault Systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numOnScreen : Double = 0;
    var prevNumberOnScreen : Double = 0;
    var isOperationPressed : Bool = false;
    var operatorSelected : Int = 0;
    
    @IBOutlet weak var textEditor: UILabel!
    
    
    @IBAction func clickOnNumbers(_ sender: UIButton) {
        
        if textEditor.text == "inf"
        {
            textEditor.text = "";
        }
        
        if isOperationPressed == true {
            textEditor.text = String(sender.tag - 1 );
            numOnScreen = Double(textEditor.text!)!;
            isOperationPressed = false;
        }
        else
        {
            // handle two cases
            // 1. adding . to existing float number.
            // 2. adding . when nothing is testeditor
            if sender.tag == 19
            {
                if textEditor.text == ""
                {
                    textEditor.text = "0.";
                }
                else
                {
                    let isDOTpresent = textEditor.text?.contains(".");
                    
                    if isDOTpresent == false
                    {
                        textEditor.text = textEditor.text! + ".";
                    }
                }
            }
            else
            {
                textEditor.text! += String(sender.tag - 1);
            }
            numOnScreen = Double(textEditor.text!)!;
        }
    }
    
    
    
    @IBAction func operations(_ sender: UIButton) {
        
        if  textEditor.text != ""
        {
            if sender.tag != 16 && sender.tag != 18
            {
                prevNumberOnScreen = Double(textEditor.text!)!;
                operatorSelected = sender.tag;
                isOperationPressed = true;
                switch sender.tag
                {
                case 11:
                    textEditor.text = "";
                    numOnScreen = 0;
                    prevNumberOnScreen = 0;
                    operatorSelected = 0;
                    isOperationPressed = false;
                case 12:
                    textEditor.text = "/";
                case 13:
                    textEditor.text = "*";
                case 14:
                    textEditor.text = "-";
                case 15:
                    textEditor.text = "+";
                case 17:
                    numOnScreen *= -1;
                    textEditor.text = String(numOnScreen);
                    
                default:
                    textEditor.text = "";
                    numOnScreen = 0;
                    prevNumberOnScreen = 0;
                    operatorSelected = 0;
                    isOperationPressed = false;
                }
            }
            else if sender.tag == 16
            {
                if operatorSelected == 12
                {
                    textEditor.text = String(prevNumberOnScreen/numOnScreen);
                }
                else if operatorSelected == 13
                {
                    textEditor.text = String(prevNumberOnScreen*numOnScreen);
                }
                else if operatorSelected == 14
                {
                    textEditor.text = String(prevNumberOnScreen-numOnScreen);
                }
                else if operatorSelected == 15
                {
                    textEditor.text = String(prevNumberOnScreen+numOnScreen);
                }
            }
            else if sender.tag == 18
            {
                if prevNumberOnScreen == 0
                {
                    textEditor.text = String(numOnScreen/100);
                }
                else
                {
                    textEditor.text = String(prevNumberOnScreen * (numOnScreen/100));
                }
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

