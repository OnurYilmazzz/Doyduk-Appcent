//
//  DishDetailVC.swift
//  Doyduk-Appcent
//
//  Created by onur yılmaz on 30.05.2022.
//

import UIKit
import Kingfisher
class DishDetailVC: UIViewController {

    @IBOutlet weak var dishImageView: UIImageView!
   
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishPrice: UILabel!
    @IBOutlet weak var dishDesc: UILabel!
    
    var dish: Dish!
    override func viewDidLoad() {
        super.viewDidLoad()

           setupUI()
    }
    func setupUI() {
        dishImageView.kf.setImage(with: URL(string: dish.image_url))
        dishPrice.text = "\(dish.price)"
        dishName.text = dish.name
        dishDesc.text = dish.description
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
