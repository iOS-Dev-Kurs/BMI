//
//  ViewController.swift
//  BMI
//
//  Created by Nils Fischer on 08.03.15.
//  Copyright (c) 2015 Nils Fischer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var bmi: Float? {
        if let weight = decimalNumberFormatter.numberFromString(self.weightTextfield.text)?.floatValue {
            if let height = decimalNumberFormatter.numberFromString(self.heightTextfield.text)?.floatValue {
                return weight / powf(height, 2)
            }
        }
        return nil
    }
    
    lazy var decimalNumberFormatter: NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        return formatter
    }()

    @IBOutlet weak var weightTextfield: UITextField!
    @IBOutlet weak var heightTextfield: UITextField!
    @IBOutlet weak var bmiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateLabel()
    }
    
    @IBAction func textfieldEditingChanged(sender: UITextField) {
        self.updateLabel()
    }
    
    func updateLabel() {
        if let bmi = self.bmi {
            self.bmiLabel.text = decimalNumberFormatter.stringFromNumber(NSNumber(float: bmi))
        } else {
            self.bmiLabel.text = "Invalid Input"
        }
    }


}

