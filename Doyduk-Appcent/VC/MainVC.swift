//
//  MainVC.swift
//  Doyduk-Appcent
//
//  Created by onur yılmaz on 20.05.2022.
//

import UIKit
import Kingfisher

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var nameAndTableNo = ""
    var categories = [Category]()
    var catName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
 
        API.getCategoryData { model in
            self.categories = model.result
            DispatchQueue.main.async {
            self.tableView.reloadData()
            }
        }
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainCell
        
        cell.catLabel.text = categories[indexPath.row].prefix + " " + categories[indexPath.row].name
        let url = URL(string: categories[indexPath.row].img_url)
        cell.catImageView.kf.setImage(with: url!)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       catName = categories[indexPath.row].name
        performSegue(withIdentifier: "toDetail", sender: self)
    }
   
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toDetail" {
            let vc = segue.destination as! DishesVC
            vc.titleString = catName
        }
    }
}

