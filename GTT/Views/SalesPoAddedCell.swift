//
//  SalesPoAddedCell.swift
//  GTT
//
//  Created by ADMS on 15/03/22.
//

import UIKit

class SalesPoAddedCell: UITableViewCell {

    @IBOutlet weak var lblMaterial:UILabel!
    @IBOutlet weak var lblSaleQty:UILabel!
    @IBOutlet weak var lblSupplier:UILabel!
    @IBOutlet weak var lblPackaging:UILabel!
    @IBOutlet weak var lblSrNo:UILabel!
    @IBOutlet weak var btnDelete:UIButton!
    @IBOutlet weak var purchaseVw:UIView!

    @IBOutlet weak var viewHeightConstraint:NSLayoutConstraint!


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
