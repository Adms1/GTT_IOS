//
//  ShipmentCell.swift
//  GTT
//
//  Created by ADMS on 25/03/22.
//

import UIKit

class ShipmentCell: UITableViewCell {

    @IBOutlet weak var lblSupplierName:UILabel!
    @IBOutlet weak var lblEquipmentTypeName:UILabel!
    @IBOutlet weak var lblFinalPlaceOfDelivery:UILabel!
    @IBOutlet weak var lblDeliveryTerm:UILabel!
    @IBOutlet weak var lblPaymentTerm:UILabel!
    @IBOutlet weak var purchaseVw:UIView!
    
    @IBOutlet weak var btnEdit:UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
