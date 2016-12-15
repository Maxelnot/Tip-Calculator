//
//  ViewController.swift
//  TipCalc
//
//  Created by Cong Tam Quang Hoang on 15/12/16.
//  Copyright © 2016 Cong Tam Quang Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults()
    @IBOutlet weak var tipPercentControl: UISegmentedControl!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var totalLabel1: UILabel!
    @IBOutlet weak var totalLabel2: UILabel!
    @IBOutlet weak var totalLabel4: UILabel!
    @IBOutlet weak var totalLabel3: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switch defaults.double(forKey: "defaultTipPercent") {
        case 0.2:
            tipPercentControl.selectedSegmentIndex = 1
        case 0.25:
            tipPercentControl.selectedSegmentIndex = 2
        default:
            tipPercentControl.selectedSegmentIndex = 0
        }
        tipCalculation(tipPercentControl)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    
    }
  
    @IBAction func tipCalculation(_ sender: AnyObject) {
        
        let tipPercent = [0.15, 0.2, 0.25]
        
        let bill = Double(billAmount.text!) ?? 0.0
        let tip = bill * tipPercent[tipPercentControl.selectedSegmentIndex]
        let total = tip + bill
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel1.text = String(format: "$%.2f", total)
        totalLabel2.text = String(format: "$%.2f", total/2)
        totalLabel3.text = String(format: "$%.2f", total/3)
        totalLabel4.text = String(format: "$%.2f", total/4)
    }
    
}

