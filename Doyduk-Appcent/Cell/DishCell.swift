//
//  DishCell.swift
//  Doyduk-Appcent
//
//  Created by onur yılmaz on 28.05.2022.
//

import UIKit

class DishCell: UITableViewCell {

    @IBOutlet weak var dishİmageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(model: Dish){
        nameLabel.text = model.name
        descLabel.text = model.description
        priceLabel.text = "\( model.price) TL"
        dishİmageView.kf.setImage(with: URL(string: model.image_url))
        
    }
}
