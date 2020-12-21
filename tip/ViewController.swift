//
//  ViewController.swift
//  tip
//
//  Created by Eileen Huang on 11/6/20.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    let defaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let billAmount = defaults.string(forKey: "billAmount");
        billField.text = billAmount == "0" ? "" : defaults.string(forKey: "billAmount");
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "percent");
        calculateTip(Any.self);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        
        billField.becomeFirstResponder();
        
        
    }
    
    
    
    @IBAction func onTap(_ sender: Any) {
        //view.endEditing(true)
    }
 
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentage = [0.15, 0.18, 0.2]
        
        
        let bill = Double(billField.text!) ?? 0
        defaults.set(bill, forKey: "billAmount");
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format: "$%.2f", total)
        
        
        
    }
}

