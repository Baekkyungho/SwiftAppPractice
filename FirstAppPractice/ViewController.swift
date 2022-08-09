//
//  ViewController.swift
//  FirstAppPractice
//
//  Created by 백경호 on 2022/07/26.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }

    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }

    
    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더의 밸류값을가지고 메인레이블의 텍스트를 세팅
        number = Int(sender.value * 60)
        mainLabel.text = "\(number) 초"
      
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지나갈때마다 무언가를 실행
        timer?.invalidate()
        
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Seconds), userInfo: nil, repeats: true)
//
        
        

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            // 반복을 하고 싶은 코드

            if number > 0 {
                number -= 1
                // 슬라이더도 줄여야됨
                // 레이블표시도 다시 해줘야됨
                slider.value = Float(number) / Float(60)
                mainLabel.text = "\(number) 초"
            } else {
                number = 0
                mainLabel.text = "초를 선택하세요"
                timer?.invalidate()
                // 소리를 나게 해야함
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }

        }
    }
    
//   @objc func doSomethingAfter1Seconds() {
//
//       if number > 0 {
//           number -= 1
//           // 슬라이더도 줄여야됨
//           // 레이블표시도 다시 해줘야됨
//           slider.value = Float(number) / Float(60)
//           mainLabel.text = "\(number) 초"
//       } else {
//           number = 0
//           mainLabel.text = "초를 선택하세요"
//           timer?.invalidate()
//           // 소리를 나게 해야함
//           AudioServicesPlayAlertSound(SystemSoundID(1322))
//       }
//    }

    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화 세팅
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
        number = 0
        timer?.invalidate()

    }
    
    
    
    
    
    
}


