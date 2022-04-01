//
//  PurchaseOderCell.swift
//  GTT
//
//  Created by ADMS on 07/03/22.
//

import UIKit

class PurchaseOderCell: UITableViewCell {

    @IBOutlet weak var lblSupplierName:UILabel!
    @IBOutlet weak var lblEquipmentTypeName:UILabel!
    @IBOutlet weak var lblFinalPlaceOfDelivery:UILabel!
    @IBOutlet weak var lblDeliveryTerm:UILabel!
    @IBOutlet weak var lblPaymentTerm:UILabel!
    @IBOutlet weak var purchaseVw:UIView!
    @IBOutlet weak var btnEdit:UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
