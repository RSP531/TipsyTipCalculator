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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = paymentPerPerson!
        settingsLabel.text = "Split between \(Int(splitCount)) people, with \(Int(tipPercentage*100))% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
