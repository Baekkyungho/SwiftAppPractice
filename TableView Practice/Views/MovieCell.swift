//
//  MovieCell.swift
//  TableView Practice
//
//  Created by 백경호 on 2022/08/05.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var descriptionLable: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
