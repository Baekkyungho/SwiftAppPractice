//
//  SecondViewController.swift
//  BMI Practice
//
//  Created by 백경호 on 2022/08/04.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    
//    var bmiNumber: Double?
//    var adviceString: String?
//    var bmiColor: UIColor?
    
    var bmi: BMI?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
    }
    
    func configureUI() {
        
        // 전화면에서 전달받은 BMI를 통해 셋팅
        bmiNumberLabel.text = "\(bmi!.value)"
        bmiNumberLabel.backgroundColor = bmi?.matchColor
        adviceLabel.text = bmi?.advice
        
        // UI셋팅
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8

        
        backButton.layer.cornerRadius = 5
        
        
    }
    

    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    

}
