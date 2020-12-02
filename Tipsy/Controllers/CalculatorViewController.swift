//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var eachPayAmount: Double = 0.0
    var tipPercentage:Double = 0.0
    var splitCount: Double = 0.0
    var totalBillAmount: Double = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let buttonTitlePressed = sender.title(for: .normal) ?? ""
        
        billTextField.endEditing(true)
        
        // there has to be a better way...
        if buttonTitlePressed == "20%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        } else if buttonTitlePressed == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false

        } else {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        totalBillAmount = Double(billTextField.text!)!
        splitCount = Double(splitNumberLabel.text!)!

        if zeroPctButton.isSelected == true {
            tipPercentage = 0.0
        } else if tenPctButton.isSelected == true {
            tipPercentage = 0.1
        } else if twentyPctButton.isSelected == true {
            tipPercentage = 0.2
        } else {
            print("No button selected!")
        }
        
        eachPayAmount = ((totalBillAmount * tipPercentage) + totalBillAmount ) / splitCount
        
        //In Main.storyboard there is a segue between CalculatorVC and ResultsVC with the identifier "goToResults".
        //This line triggers the segue to happen.
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    //This method gets triggered just before the segue starts.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //If the currently triggered segue is the "goToResults" segue.
        if segue.identifier == "goToResult" {
            
            //Get hold of the instance of the destination VC and type cast it to a ResultViewController.
            let destinationVC = segue.destination as! ResultsViewController
            
            //Set the destination ResultsViewController's properties.
            destinationVC.paymentPerPerson = String(format: "%.2f", eachPayAmount)
            destinationVC.tipPercentage = tipPercentage
            destinationVC.splitCount = splitCount
            
        }
    }
    
}

