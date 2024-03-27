//
//  RestaurantViewController.swift
//  RestaurantRater
//
//  Created by Celes Augustus on 3/26/24.
//

import UIKit
import CoreData

class RestaurantViewController: UIViewController {
    let nextRate = "nextRate"
    
    @IBOutlet weak var textFieldName: UITextField!
    
    @IBOutlet weak var textFieldAddress: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    var restaurantID: String?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextButtonSelected(_ sender: UIButton) {
        saveRestaurant()
        performSegue(withIdentifier: nextRate, sender: nil)
    }
    func saveRestaurant() {
            guard let name = textFieldName.text, !name.isEmpty,
                  let address = textFieldAddress.text, !address.isEmpty else {
                showAlert(message: "Please fill in all fields.")
                return
            }
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let restaurant = Restaurant(context: context)
            restaurant.restaurantName = name
            restaurant.restaurantAddress = address
            
            do {
                try context.save()
                restaurantID = restaurant.objectID.uriRepresentation().absoluteString
            } catch {
                print("Failed to save restaurant: \(error)")
            }
        }
        
    func showAlert(message: String) {
            let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextRate" {
            if let destinationVC = segue.destination as? RateDishViewController {
                    destinationVC.restaurantID = restaurantID
            }
        }
    }
}
