//
//  ViewController.swift
//  Calc
//
//  Created by Steel LaPointe on 29/10/17.
//  Copyright © 2017 Steel LaPointe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var PreviousNumber:Double = 0;
    var DoingMaths = false;
    var operation = 0;
    
    @IBOutlet weak var Label: UILabel!
    
    @IBAction func Numbers(_ sender: UIButton) {
        if DoingMaths == true
        {
            Label.text = String(sender.tag-1);
            numberOnScreen = Double(Label.text!)!
            DoingMaths = false;
        }
        else{
            Label.text = Label.text! + String(sender.tag-1)
            numberOnScreen = Double(Label.text!)!

        }
    }
    
    @IBAction func Buttons(_ sender: UIButton) {
        if Label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            PreviousNumber = Double(Label.text!)!
            if sender.tag == 12 //div
            {
                Label.text = "/";
            }
            else if sender.tag == 13 //multi
            {
                Label.text = "*";
            }
            else if sender.tag == 14 //minus
            {
                Label.text = "-";
            }
            else if sender.tag == 15 //add
            {
                Label.text = "+";
                
            }
            DoingMaths = true;
            operation = sender.tag;
        }
        else if sender.tag == 16 {
            if operation == 12{
                Label.text = String(PreviousNumber / numberOnScreen);
            }
            else if operation == 13{
                Label.text = String(PreviousNumber * numberOnScreen);
            }
            
            else if operation == 14{
                Label.text = String(PreviousNumber - numberOnScreen);
            }

            else if operation == 15{
                Label.text = String(PreviousNumber + numberOnScreen);
            }

        }
        else if sender.tag == 11 {
            Label.text = "";
            PreviousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

