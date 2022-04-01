//
//  BankInfoVC.swift
//  GTT
//
//  Created by ADMS on 17/02/22.
//

import UIKit

class BankInfoVC: UIViewController {

    @IBOutlet weak var btnSubmit:UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()

//        btnSubmit.layer.cornerRadius = 6.0
//        btnSubmit.layer.masksToBounds = true
    }
    @IBAction func btnClickBAck()
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnClickSubmit()
    {
        let  vc =  self.navigationController?.viewControllers.filter({$0 is ViewController}).first
        self.navigationController?.popToViewController(vc!, animated: true)

    }

}
