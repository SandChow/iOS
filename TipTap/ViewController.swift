//
//  ViewController.swift
//  TipTap
//
//  Created by Sandeep Chowdary on 12/12/16.
//  Copyright © 2016 Sandeep Chowdary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) 
    {
        let key = "20%"
        billField.becomeFirstResponder()
        let defaults = UserDefaults.standard
        if let key = defaults.object(forKey: key) as? Int
        {
            tipControl.selectedSegmentIndex = key
            billField.text = ""
            tipLabel.text = "$0.00"
            totalLabel.text = "$0.00"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: AnyObject)
    {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject)
    {
        let tipPercentages = [0.15, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

