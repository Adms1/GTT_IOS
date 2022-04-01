//
//  SalesCell.swift
//  GTT
//
//  Created by ADMS on 16/02/22.
//

import UIKit

class SalesCell: UITableViewCell {

    @IBOutlet weak var lblMaterial:UILabel!
    @IBOutlet weak var lblContractQty:UILabel!
    @IBOutlet weak var lblRate:UILabel!
    @IBOutlet weak var lblCountry:UILabel!
    @IBOutlet weak var lblAvgLoading:UILabel!
    @IBOutlet weak var lblPackging:UILabel!
    @IBOutlet weak var btnDelete:UIButton!

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
