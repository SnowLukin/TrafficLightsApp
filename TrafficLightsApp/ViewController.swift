//
//  ViewController.swift
//  TrafficLightsApp
//
//  Created by Snow Lukin on 07.12.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        redLightView.alpha = 0.3
        yellowLightView.alpha = 0.3
        greenLightView.alpha = 0.3
        
        startButton.setTitle("START", for: .normal)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setCircleView(lightView: redLightView)
        setCircleView(lightView: yellowLightView)
        setCircleView(lightView: greenLightView)
    }
    
    private func setCircleView(lightView: UIView) {
        lightView.layer.cornerRadius = lightView.layer.bounds.width / 2
        lightView.clipsToBounds = true
        lightView.layer.borderColor = UIColor.white.cgColor
        lightView.layer.borderWidth = 1
    }
    
    @IBAction func changeLightColor() {
        startButton.setTitle("NEXT", for: .normal)
        
        switch redLightView.alpha {
        case 1:
            redLightView.alpha = 0.3
            yellowLightView.alpha = 1
        case _ where yellowLightView.alpha == 1:
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 1
        default:
            greenLightView.alpha = 0.3
            redLightView.alpha = 1
        }
    }
    
}

