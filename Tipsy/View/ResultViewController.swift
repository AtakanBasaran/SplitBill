//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Atakan Başaran on 16.11.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var finalPayment = ""
    var tipPercent = 0.0
    var numberSplit = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "\(finalPayment)$"
        let stringNumberSplit = String(format: "%1.f", tipPercent * 100)
        settingsLabel.text = "Split betwen \(numberSplit) people, with \(stringNumberSplit)% tip"

    }
    
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    
    

    

}
