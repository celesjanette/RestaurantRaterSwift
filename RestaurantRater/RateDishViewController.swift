//
//  RateDishViewController.swift
//  RestaurantRater
//
//  Created by Celes Augustus on 3/26/24.
//

import UIKit
import CoreData
class RateDishViewController: UIViewController {
    
    @IBOutlet weak var dishType: UITextField!
    @IBOutlet weak var dishName: UITextField!
    
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var ratingSlider: UISlider!
    
    @IBOutlet weak var ratingLabel: UILabel!
    var restaurantID: String?
    var dishRate: Int?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

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
        dishRate = ratingValue
    }
    
    @IBAction func btnSubmitSave(_ sender: UIButton) {
        guard let dishName = dishName.text, !dishName.isEmpty,
              let dishType = dishType.text, !dishType.isEmpty,
              let dishRate = dishRate else {
            showAlert(message: "Please fill in all fields.")
            return
        }
        showAlert(message: "Rating Submitted")
        saveDish()
    }
    func saveDish() {
        let context = appDelegate.persistentContainer.viewContext
                let rate = Rates(context: context) // Assuming Rates is the entity name
                rate.dishName = dishName.text
                rate.dishType = dishType.text
                rate.dishRate = Int16(dishRate ?? 0)
                rate.restaurantID = restaurantID
                appDelegate.saveContext()
            }

        func showAlert(message: String) {
            let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "yourSegueIdentifier" {
                if let destinationVC = segue.destination as? RateDishViewController {
                    
                    destinationVC.restaurantID = restaurantID
                }
            }
        }
    }

