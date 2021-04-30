//
//  moviecell.swift
//  movie list.x
//
//  Created by ahmed aelsebaay on 24/04/2021.
//

import UIKit

class moviecell: UITableViewCell {

    @IBOutlet weak var movietitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
