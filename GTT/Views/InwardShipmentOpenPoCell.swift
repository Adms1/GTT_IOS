//
//  InwardShipmentOpenPoCell.swift
//  GTT
//
//  Created by ADMS on 16/03/22.
//

import UIKit

class InwardShipmentOpenPoCell: UITableViewCell {

    @IBOutlet weak var vwHeaderHeightConstraint:NSLayoutConstraint!
    @IBOutlet weak var vwFooterHeightConstraint:NSLayoutConstraint!

    @IBOutlet weak var btnSave:UIButton!

    @IBOutlet weak var vwOpenPO:UIView!

    @IBOutlet weak var lblPoNo:UILabel!
    @IBOutlet weak var lblDate:UILabel!
    @IBOutlet weak var lblQtyOrder:UILabel!
    @IBOutlet weak var lblQtyRecive:UILabel!
    @IBOutlet weak var lblQtyReciveShipment:UILabel!


    @IBOutlet weak var lblPoNoValue:UILabel!
    @IBOutlet weak var lblDateValue:UILabel!
    @IBOutlet weak var lblQtyOrderValue:UILabel!
    @IBOutlet weak var lblQtyReciveValue:UILabel!
    @IBOutlet weak var txtQtyReciveShipmentValue:UITextField!
    @IBOutlet weak var lblQtyReciveShipmentValue:UIView!


    @IBOutlet weak var lblNo1:UILabel!
    @IBOutlet weak var lblNo2:UILabel!
    @IBOutlet weak var lblNo3:UILabel!
    @IBOutlet weak var lblTotal:UILabel!
    @IBOutlet weak var vwSave:UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
