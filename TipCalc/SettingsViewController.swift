//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Cong Tam Quang Hoang on 15/12/16.
//  Copyright © 2016 Cong Tam Quang Hoang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let defaults =  UserDefaults()
    @IBOutlet weak var defaultTip: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch defaults.double(forKey: "defaultTipPercent") {
        case 0.25:
            defaultTip.selectedSegmentIndex = 2
        case 0.2:
            defaultTip.selectedSegmentIndex = 1
        default:
            defaultTip.selectedSegmentIndex = 0
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultChanged(_ sender: Any) {
        let tipPercentages = [ 0.15, 0.2, 0.25 ]
    defaults.set(tipPercentages[defaultTip.selectedSegmentIndex],forKey:"defaultTipPercent")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
