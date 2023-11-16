//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var zeroTip: UIButton!
    @IBOutlet weak var tenPTip: UIButton!
    @IBOutlet weak var twentyPTip: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPercent = 0.0
    var splitNumber = 2
    var paymentString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitNumberLabel.text = String(splitNumber)
        
    }
    
    
    @IBAction func tipButton(_ sender: UIButton) {
        
        billText.endEditing(true)
        
        if sender.currentTitle == "0%" {
            tipPercent = 0.0
            zeroTip.isSelected = true
            tenPTip.isSelected = false
            twentyPTip.isSelected = false

            
        } else if sender.currentTitle == "10%" {
            tipPercent = 0.1
            zeroTip.isSelected = false
            tenPTip.isSelected = true
            twentyPTip.isSelected = false
            
        } else {
            tipPercent = 0.2
            zeroTip.isSelected = false
            tenPTip.isSelected = false
            twentyPTip.isSelected = true   
        }
    }
    
    
    @IBAction func stepperButton(_ sender: UIStepper) {
        
        let stepperValue = sender.value
        
        splitNumber = Int(stepperValue)
        splitNumberLabel.text = String(splitNumber)

            
        
    }
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        if var billValue = Double(billText.text!) {
            billValue = billValue + (billValue * tipPercent)
            let payment = billValue / Double(splitNumber)
            paymentString = String(format: "%2.f", payment)
            performSegue(withIdentifier: "toResultVC", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultVC" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.finalPayment = paymentString
            destinationVC.numberSplit = splitNumber
            destinationVC.tipPercent = tipPercent
        }
    }
    
    

}

