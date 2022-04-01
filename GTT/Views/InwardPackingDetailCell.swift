//
//  InwardPackingDetailCell.swift
//  GTT
//
//  Created by ADMS on 16/03/22.
//

import UIKit

class InwardPackingDetailCell: UITableViewCell {

    @IBOutlet weak var vwHeaderHeightConstraint:NSLayoutConstraint!
    @IBOutlet weak var vwFooterHeightConstraint:NSLayoutConstraint!

    @IBOutlet weak var btnSave:UIButton!


    @IBOutlet weak var vwOpenPO:UIView!

    @IBOutlet weak var lblContainer:UILabel!
    @IBOutlet weak var lblSeal:UILabel!
    @IBOutlet weak var lblGrossWT:UILabel!
    @IBOutlet weak var lblNetWT:UILabel!


    @IBOutlet weak var lblContainerValue:UILabel!
    @IBOutlet weak var lblSealValue:UILabel!
    @IBOutlet weak var lblGrossWTValue:UILabel!
    @IBOutlet weak var lblNetWTValue:UILabel!


    @IBOutlet weak var lblNo1:UILabel!
    @IBOutlet weak var lblNo2:UILabel!
    @IBOutlet weak var lblTotal:UILabel!
    @IBOutlet weak var vwSave:UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
