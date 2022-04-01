//
//  HeaderView.swift
//  GTT
//
//  Created by ADMS on 15/02/22.
//

import UIKit

class HeaderView: UIView {

    @IBOutlet weak var lblnavigationTitle:UILabel!
    @IBOutlet weak var btnBack:UIButton!
    @IBOutlet weak var containerVW:UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonFile()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonFile()
    }

    private func commonFile()
    {
        Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
        addSubview(containerVW)
        containerVW.frame = self.bounds
        containerVW.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }

    @IBAction func btnClickBack(_sender:UIButton)
    {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController?.navigationController?.popViewController(animated: true)
    }
}
