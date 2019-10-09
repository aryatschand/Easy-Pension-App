//
//  CalculateVC.swift
//  Pension Calculator
//
//  Created by Arya Tschand on 8/22/19.
//  Copyright © 2019 Arya Tschand. All rights reserved.
//

import UIKit

class CalculateVC: UIViewController {
    
    var total: Int = 0
    var yearly: Double = 0
    var sendString: String = ""

    @IBOutlet weak var SalaryOne: UITextField!
    
    @IBOutlet weak var SalaryTwo: UITextField!
    
    @IBOutlet weak var SalaryThree: UITextField!
    
    @IBOutlet weak var Percentage: UITextField!
    
    @IBOutlet weak var Year: UITextField!
    @IBOutlet weak var Month: UITextField!
    
    @IBAction func Reset(_ sender: Any) {
        SalaryOne.text = ""
        SalaryTwo.text = ""
        SalaryThree.text = ""
        Percentage.text = ""
        Year.text = ""
        Month.text = ""
        PensionLabel.isHidden = true
        YearLabel.isHidden = true
        OrLabel.isHidden = true
        MonthLabel.isHidden = true
    }
    
    @IBAction func Calculate(_ sender: Any) {
        let salaryone: String = SalaryOne.text!
        let salarytwo: String = SalaryTwo.text!
        let salarythree: String = SalaryThree.text!
        let percent: String = Percentage.text!
        let years: String = Year.text!
        var months: String = Month.text!
        
        if months == "" {
            months = "0"
        }
        
        if SalaryOne.text != "" && SalaryTwo.text != "" && SalaryThree.text != "" && Percentage.text != "" && Year.text != "" && Int(months)! < 12 && Double(percent)! < 10 {
            total = Int(salaryone)! + Int(salarytwo)! + Int(salarythree)!
            yearly = Double(total)/3.0
            yearly = yearly * Double(percent)! / 100
            yearly = yearly * (Double(years)! + (Double(months)!/12))
            yearly = yearly * 100
            var temporary: Int = Int(yearly)
            yearly = Double(temporary)/100
            
            PensionLabel.isHidden = false
            YearLabel.isHidden = false
            OrLabel.isHidden = false
            MonthLabel.isHidden = false
            
            YearLabel.text = "$" + String(Int(yearly)) + "/Year"
            MonthLabel.text = "$" + (String(Int(yearly/12))) + "/Month"
            
        } else {
            if months != "" {
                if Int(months)! >= 12 {
                    Month.text = ""
                }
            }
            
            if percent != "" {
                if Int(percent)! >= 10 {
                    Percentage.text = ""
                }
            }
            
            let alert = UIAlertController(title: "Missing Information", message: "Some information is missing or invalid. Please enter valid information to complete calculation.", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "OK", style: .cancel) { (action) in
            }
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
        }
        SalaryOne.resignFirstResponder()
        SalaryTwo.resignFirstResponder()
        SalaryThree.resignFirstResponder()
        Percentage.resignFirstResponder()
        Year.resignFirstResponder()
        MonthLabel.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SalaryOne.text = ""
        SalaryTwo.text = ""
        SalaryThree.text = ""
        Percentage.text = ""
        Year.text = ""
        Month.text = ""
        PensionLabel.isHidden = true
        YearLabel.isHidden = true
        OrLabel.isHidden = true
        MonthLabel.isHidden = true
    }
    
    @IBOutlet weak var PensionLabel: UILabel!
    @IBOutlet weak var YearLabel: UILabel!
    @IBOutlet weak var OrLabel: UILabel!
    @IBOutlet weak var MonthLabel: UILabel!
    
    @IBAction func Salary(_ sender: Any) {
        sendString = "Enter in your three highest annual salaries in dollars.\n\nThe salaries do not have to be in consecutive years and do not have to be your last three years of employment."
        self.performSegue(withIdentifier: "info", sender: self)
    }
    
    @IBAction func PercentageFactor(_ sender: Any) {
        sendString = "Each pension plan has a unique percentage factor, often based on length of employment.\n\nThe percentage factor is a number representing the percent of income you get back as pension.\n\nPercentage factor is usually between 1.5% and 3%.\n\nDo not enter above 10%."
        self.performSegue(withIdentifier: "info", sender: self)
    }
    
    @IBAction func Years(_ sender: Any) {
        sendString = "Enter in the length of employment in years and months.\n\nThe months field can be left blank.\n\nDo not enter above 11 months."
        self.performSegue(withIdentifier: "info", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "info" {
            var InfoVC = segue.destination as! InfoVC
            InfoVC.text = sendString
        }
    }
}
