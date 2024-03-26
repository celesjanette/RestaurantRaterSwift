//
//  RateDishViewController.swift
//  RestaurantRater
//
//  Created by Celes Augustus on 3/26/24.
//

import UIKit

class RateDishViewController: UIViewController {

    //@IBOutlet weak var ratingSlider: UISlider!
    
    @IBOutlet weak var ratingSlider: UISlider!
 //   @IBOutlet weak var ratingLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set initial slider value
        ratingSlider.value = 0.0
        
        // Call the action method when slider value changes
        ratingSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        // Update label text to show current rating value
        let ratingValue = Int(sender.value)
       // ratingLabel.text = "Rating: \(ratingValue)"
    }
}
