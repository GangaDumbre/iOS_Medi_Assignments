//
//  AppViewController.swift
//  Project2
//
//  Created by admin on 26/02/20.
//  Copyright © 2020 Dassault Systemes. All rights reserved.
//

import UIKit

/*
 Pattern:
        W
        |
       TBC
    -----------
    |    |    |
   Nc1  Nc2  Nc3
    |    |    |
   Vc1  Vc2  Vc3
 
 */

class AppViewController: UIViewController {

    var resultLabel : UILabel!
    var label1 : UILabel?
    var btn : UIButton?
    
    var firstNumberText = ""
    var secondNumberText = ""
    var op = ""
    var isFirstNumber = true
    var hasOp = false
    var canClear = true
    
    func loadTableOfName(){
        resultLabel =  UILabel(frame: CGRect(x: 10, y: 10, width: 350, height: 60 ))
        resultLabel?.text = "0"
        resultLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        resultLabel?.textColor = UIColor.white
        resultLabel?.textAlignment = .right
        view.addSubview(resultLabel!)

        //row0
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "C"
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        
        btn =  UIButton(frame: CGRect(x: 10, y: 70, width: 80, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(clearbuttonAction), for: .touchDown)
        view.addSubview(btn!)
        
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "+/-"
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        
        var btn1 =  UIButton(frame: CGRect(x: 100, y: 70, width: 80, height: 80 ))
        btn1.addSubview(label1!)
        btn1.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn1)
        
        
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "%"
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        btn =  UIButton(frame: CGRect(x: 190, y: 70, width: 80, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn!)
        
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "÷"
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        btn =  UIButton(frame: CGRect(x: 280, y: 70, width: 80, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn!)
        
        //row1
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "7"
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        btn =  UIButton(frame: CGRect(x: 10, y: 160, width: 80, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn!)
        
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "8"
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        btn =  UIButton(frame: CGRect(x: 100, y: 160, width: 80, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn!)
        
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "9"
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        btn =  UIButton(frame: CGRect(x: 190, y: 160, width: 80, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn!)
        
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "X"
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        btn =  UIButton(frame: CGRect(x: 280, y: 160, width: 80, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn!)
        
        //row2
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "4"
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        btn =  UIButton(frame: CGRect(x: 10, y: 250, width: 80, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn!)
        
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "5"
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        btn =  UIButton(frame: CGRect(x: 100, y: 250, width: 80, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn!)
        
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "6"
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        btn =  UIButton(frame: CGRect(x: 190, y: 250, width: 80, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn!)
        
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "-"
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        btn =  UIButton(frame: CGRect(x: 280, y: 250, width: 80, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn!)
        
        //row3
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "1"
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        btn =  UIButton(frame: CGRect(x: 10, y: 340, width: 80, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn!)
        
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "2"
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        btn =  UIButton(frame: CGRect(x: 100, y: 340, width: 80, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn!)
        
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "3"
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        btn =  UIButton(frame: CGRect(x: 190, y: 340, width: 80, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn!)
        
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "+"
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        btn =  UIButton(frame: CGRect(x: 280, y: 340, width: 80, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn!)
        
        //row4
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 170, height: 80 ))
        label1?.text = "0"
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        btn =  UIButton(frame: CGRect(x: 10, y: 430, width: 170, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn!)
        
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "."
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        btn =  UIButton(frame: CGRect(x: 190, y: 430, width: 80, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn!)
        
        label1 =  UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80 ))
        label1?.text = "="
        label1?.font = UIFont.boldSystemFont(ofSize: 30.0)
        label1?.textColor = UIColor.white
        label1?.textAlignment = .center
        label1?.backgroundColor = UIColor.orange
        btn =  UIButton(frame: CGRect(x: 280, y: 430, width: 80, height: 80 ))
        btn?.addSubview(label1!)
        btn?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        view.addSubview(btn!)
    }
    
    @objc func clearbuttonAction(sender: UIButton!) {
      resultLabel.text = ""
    }
     @objc func buttonAction(sender: UIButton!) {
        print("clicked")
      
        if canClear {
                resultLabel.text = ""
                canClear = false
            }
            let currentText = resultLabel.text!
        
        let subview = sender.subviews
        var lab = subview.last as! UILabel
        let textLabel = lab.text
        
        
            //let textLabel = sender.titleLabel?.text
            if let text = textLabel {
                switch text {
                case "+", "X", "÷", "-":
                    if hasOp {
                        return
                    }
                    op = text
                    if isFirstNumber {
                        firstNumberText = "\(currentText)"
                    }
                    isFirstNumber = false
                    hasOp = true
                    resultLabel.text = "\(currentText) \(op) "
                    
                    break
                case "=":
                    isFirstNumber = true
                    if hasOp {
                        let result = calculate()
                        resultLabel.text = "\(result)"
                    } else {
                        resultLabel.text = "\(currentText)"
                    }
                    hasOp = false
                    //canClear = true
                    
                    break
                 case "%":
                     let val = Double(currentText)!
                     let result = val / 100
                    resultLabel.text = "\(result)"
                    break
                case "+/-":
                     let val = Double(currentText)!
                     let result = -val
                    resultLabel.text = "\(result)"
                    break
                default:
                    if isFirstNumber {
                        firstNumberText = "\(firstNumberText)\(text)"
                    } else {
                        secondNumberText = "\(secondNumberText)\(text)"
                    }
                    resultLabel.text = "\(currentText)\(text)"
                    break;
                }
            }
        }
        
        func calculate() -> Double {
            let firstNumber = Double(firstNumberText)!
            let secondNumber = Double(secondNumberText)!
            firstNumberText = ""
            secondNumberText = ""
            switch op {
            case "+":
                return firstNumber + secondNumber
            case "-":
                return firstNumber - secondNumber
            case "X":
                return firstNumber * secondNumber
            case "÷":
                return firstNumber / secondNumber
            default:
                return 0
            }
        }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.black
        edgesForExtendedLayout = UIRectEdge()//shift origin
        loadTableOfName()
    }


}
