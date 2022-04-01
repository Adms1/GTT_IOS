//
//  PurchaseHeaderCell.swift
//  GTT
//
//  Created by ADMS on 15/02/22.
//

import UIKit

class PurchaseHeaderCell: UITableViewCell {

    @IBOutlet weak var lblHeaderTitle:UILabel!
    @IBOutlet weak var btnPlus:UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
