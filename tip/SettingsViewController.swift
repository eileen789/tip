//
//  SettingsViewController.swift
//  tip
//
//  Created by Eileen Huang on 12/4/20.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
     
            
    @IBAction func tipControlChange(_ sender: Any) {
        
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "percent")
        defaults.synchronize()
        
        print(defaults.integer(forKey: "percent"))
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
