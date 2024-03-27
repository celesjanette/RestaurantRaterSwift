//
//  RateDishViewController.swift
//  RestaurantRater
//
//  Created by Celes Augustus on 3/26/24.
//

import UIKit

class RateDishViewController: UIViewController {
    
    
    @IBOutlet weak var ratingSlider: UISlider!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingSlider.minimumValue = 0
               ratingSlider.maximumValue = 5
               
               ratingSlider.value = 0
               
        
        
        ratingSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
       
        updateRatingLabel(value: sender.value)
    }
    
    func updateRatingLabel(value: Float) {
        let ratingValue = Int(value)
        ratingLabel.text = "\(ratingValue)"
    }
}
