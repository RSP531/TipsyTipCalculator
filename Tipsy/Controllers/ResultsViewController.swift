//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Robert on 12/2/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var paymentPerPerson: String?
    var tipPercentage:Double = 0.0
    var splitCount: Double = 0.0

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("here is the result on the second screen", paymentPerPerson!)
        totalLabel.text = paymentPerPerson!
        settingsLabel.text = "Split between \(Int(splitCount)) people, with \(Int(tipPercentage*100))% tip."
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
