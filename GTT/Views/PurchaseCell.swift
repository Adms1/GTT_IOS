//
//  PurchaseCell.swift
//  GTT
//
//  Created by ADMS on 15/02/22.
//

import UIKit

class PurchaseCell: UITableViewCell {

    @IBOutlet weak var lblMaterial:UILabel!
    @IBOutlet weak var lblContractQty:UILabel!
    @IBOutlet weak var lblRate:UILabel!
    @IBOutlet weak var lblCurrency:UILabel!
    @IBOutlet weak var lblAvgLoading:UILabel!
    @IBOutlet weak var btnDelete:UIButton!
    @IBOutlet weak var btnEdit:UIButton!

    @IBOutlet weak var purchaseVw:UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
