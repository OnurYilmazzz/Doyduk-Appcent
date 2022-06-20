//
//  DishesVC.swift
//  Doyduk-Appcent
//
//  Created by onur yılmaz on 28.05.2022.
//

import UIKit
import Kingfisher

class DishesVC: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var titleString = ""
    var dishArray = [Dish]()
    var dish : Dish!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Onur"
        titleLabel.text = titleString
        tableView.delegate = self
        tableView.dataSource = self
        
        API.getDishesData { dishes in
            self.dishArray = dishes.result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
             
        
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let vc = segue.destination as! DishDetailVC
            vc.dish = dish
        }
    }

}
 extension DishesVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DishCell
        cell.configCell(model: dishArray[indexPath.row])
        return cell
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         dish = dishArray[indexPath.row]
         performSegue(withIdentifier: "detail", sender: self)
     }
}
