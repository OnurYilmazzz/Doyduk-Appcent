//
//  LoginVC.swift
//  Doyduk-Appcent
//
//  Created by onur yılmaz on 20.05.2022.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var tableNoTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        API.getDishesData { model in
            print(model)
        }
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        print(nameTextField.text!)
        print(tableNoTextField.text!)
        performSegue(withIdentifier: "toMain", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMain" {
            let destVC = segue.destination as! MainVC
                    }
    }

}


