//
//  SettingsViewController.swift
//  TipTap
//
//  Created by Sandeep Chowdary on 12/12/16.
//  Copyright © 2016 Sandeep Chowdary. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var DefaultTipControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    let defaultTipKey = "20%"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Sets the title in the Navigation Bar
        self.title = "Settings"
        DefaultTipControl.selectedSegmentIndex = defaults.integer(forKey: defaultTipKey)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTipChanged(_ sender: AnyObject)
    {
        defaults.set(DefaultTipControl.selectedSegmentIndex, forKey: defaultTipKey)
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
