//
//  ViewController.swift
//  calculator
//
//  Created by Lizard on 10/29/18.
//  Copyright © 2018 Angie Quach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var decimalFlag = false;
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        //if decimalFlag == true
        //{
            if performingMath == true
            {
                if decimalFlag == true
                {
                    label.text = label.text! + String(sender.tag-1)
                    decimalFlag = false;
                }
                else
                {
                    label.text = String(sender.tag-1)
                }
                numberOnScreen = Double(label.text!)!
                performingMath = false
            }
            else
            {
                label.text = label.text! + String(sender.tag-1)
                numberOnScreen = Double(label.text!)!
            }
        //}
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        // check if number is there
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            // divide
            if sender.tag == 12
            {
                label.text = "/"
            }
            // multiply
            else if sender.tag == 13
            {
                label.text = "*"
            }
            // minus
            else if sender.tag == 14
            {
                label.text = "-"
            }
            // plus
            else if sender.tag == 15
            {
                label.text = "+"
            }
            else if sender.tag == 17
            {
                // if text does not contain a period then add it
                if !((label.text!).contains("."))
                {
                    label.text = label.text! + "."
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
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numberOnScreen)
            }
            else if operation == 17
            {
                label.text = String(previousNumber + (numberOnScreen * 0.1))
            }
        }
        // reset everything
        else if sender.tag == 11
        {
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
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

