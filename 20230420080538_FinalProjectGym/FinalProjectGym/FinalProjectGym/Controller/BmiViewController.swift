//
//  BmiViewController.swift
//  FinalProjectGym
//
//  Created by english on 2023-04-17.
//

import UIKit

class BmiViewController: UIViewController {

    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var txtWeight: UITextField!
    
    
    @IBAction func txtHeightEditingChanged(_ sender: Any) {
        lblResult.isHidden = true;
    }
    
    @IBAction func txtWeightEditingChanged(_ sender: Any) {
        lblResult.isHidden = true;
    }
    
    @IBAction func btnCalculateTouchUpInside(_ sender: Any) {
        if let height = Double(txtHeight.text!),let weight = Double(txtWeight.text!){
            if(height>=80 &&  height<=250){
                if(weight>=30 && weight<=300){
           
                    let heightInMeters = height/100
                    let bmi = weight/(heightInMeters*heightInMeters)
                
                    let roundBmi = Double(bmi*10)/10
                    switch roundBmi{
                    case 0..<18.5:
                        lblResult.text = "BMI Classification : UnderWeight";
                        lblResult.isHidden = false;
                        lblResult.backgroundColor = UIColor.systemBlue;
                    case 18.5...24.9:
                        lblResult.text = "BMI Classification : Normal weight";
                        lblResult.isHidden = false;
                        lblResult.backgroundColor = UIColor.green;
                   case 25.0...29.9:
                        lblResult.text = "BMI Classification : Overweight";
                        lblResult.isHidden = false;
                        lblResult.backgroundColor = UIColor.yellow;
                   case 30.0...100.0:
                        lblResult.text = "BMI Classification : Obese";
                        lblResult.isHidden = false;
                        lblResult.backgroundColor = UIColor.orange;
                   default :
                        lblResult.text = "BMI  Classification : Not in range";
                        lblResult.isHidden = false;
                        lblResult.backgroundColor = UIColor.gray;
                
                    }
                }else{
                    Toast.ok(view:self, title: "Review the weight", message: "Enter a weight between 30 kg and 300 kg", handler: nil)
                }
                
        }else{
            Toast.ok(view:self, title: "Review the height", message: "Enter a height between 80 cm and 250 cm", handler: nil)
        }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblResult.isHidden = true;

    }

}

