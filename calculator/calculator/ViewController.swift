//
//  ViewController.swift
//  calculator
//
//  Created by Lizard on 10/29/18.
//  Copyright © 2018 Angie Quach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var outputNumber:Double = 0;
    var previousInput:Double = 0;
    var performingMath = false;
    var decimalFlag = false;
    var operation = 0;
    
    @IBOutlet weak var textField: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
            if performingMath == true
            {
                if decimalFlag == true
                {
                    textField.text = textField.text! + String(sender.tag-1)
                    decimalFlag = false;
                }
                else
                {
                    textField.text = String(sender.tag-1)
                }
                outputNumber = Double(textField.text!)!
                performingMath = false
            }
            else
            {
                textField.text = textField.text! + String(sender.tag-1)
                outputNumber = Double(textField.text!)!
            }
        //}
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        // check if number is there
        if textField.text != "" && sender.tag != 11 && sender.tag != 16
        {
            
            previousInput = Double(textField.text!)!
            // divide
            if sender.tag == 12
            {
                textField.text = "/"
            }
            // multiply
            else if sender.tag == 13
            {
                textField.text = "*"
            }
            // minus
            else if sender.tag == 14
            {
                textField.text = "-"
            }
            // plus
            else if sender.tag == 15
            {
                textField.text = "+"
            }
            else if sender.tag == 17
            {
                // if text does not contain a period then add it
                if !((textField.text!).contains("."))
                {
                    textField.text = textField.text! + "."
                    decimalFlag = true;
                }
            }
            operation = sender.tag
            performingMath = true;
            // end operation
        }
        else if sender.tag == 16
        {
            if operation == 12
            {
                textField.text = String(previousInput / outputNumber)
            }
            else if operation == 13
            {
                textField.text = String(previousInput * outputNumber)
            }
            else if operation == 14
            {
                textField.text = String(previousInput - outputNumber)
            }
            else if operation == 15
            {
                textField.text = String(previousInput + outputNumber)
            }
            else if operation == 17
            {
                textField.text = String(previousInput + (outputNumber * 0.1))
            }
        }
        // reset everything
        else if sender.tag == 11
        {
            textField.text = ""
            previousInput = 0;
            outputNumber = 0;
            operation = 0;
        }
        
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

}

