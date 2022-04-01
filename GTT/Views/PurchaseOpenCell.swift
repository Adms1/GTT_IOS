//
//  PurchaseOpenCell.swift
//  GTT
//
//  Created by ADMS on 14/03/22.
//

import UIKit

class PurchaseOpenCell: UITableViewCell {

    @IBOutlet weak var lblMaterial:UILabel!
    @IBOutlet weak var lblContractQty:UILabel!
    @IBOutlet weak var lblSupplier:UILabel!
    @IBOutlet weak var lblAvg:UILabel!
    @IBOutlet weak var lblAvialQty:UILabel!
    @IBOutlet weak var txtSaleQty:UITextField!
    @IBOutlet weak var btnPlus:UIButton!
    @IBOutlet weak var purchaseVw:UIView!

    @IBOutlet weak var viewHeightConstraint:NSLayoutConstraint!



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
