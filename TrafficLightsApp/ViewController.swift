//
//  ViewController.swift
//  TrafficLightsApp
//
//  Created by Snow Lukin on 07.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        redLightView.alpha = 0.3
        yellowLightView.alpha = 0.3
        greenLightView.alpha = 0.3
        
        startButton.configuration = setButtonConfig(title: "START")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        // сначала подумал что будет лучше сделать это в
        // viewdidlayoutsubviews, но там работало не корректно.
        setCircleView(lightView: redLightView)
        setCircleView(lightView: yellowLightView)
        setCircleView(lightView: greenLightView)
    }
    
    // MARK: - IB Actions
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
    
    // MARK: Private methods
    private func setButtonConfig(title: String) -> UIButton.Configuration {
        var config: UIButton.Configuration = .filled()
        config.title = title
        
        return config
    }
    
    private func setCircleView(lightView: UIView) {
        lightView.layer.cornerRadius = lightView.layer.bounds.width / 2
        lightView.clipsToBounds = true
        lightView.layer.borderColor = UIColor.white.cgColor
        lightView.layer.borderWidth = 1
    }
    
}

