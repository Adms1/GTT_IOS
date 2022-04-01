//
//  DelivaryTermVC.swift
//  GTT
//
//  Created by ADMS on 21/02/22.
//

import UIKit
import MBProgressHUD
import Alamofire

protocol delivaryDelegate:class {
    func delivaryMethod()
}

class DelivaryTermVC: UIViewController {

    @IBOutlet weak var btnSubmit:UIButton!
    @IBOutlet weak var btnCancel:UIButton!
    @IBOutlet weak var txtDelivaryName:UITextField!
    @IBOutlet weak var txtDelivaryDesc:UITextField!

    weak var delegate:delivaryDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
//        btnSubmit.layer.cornerRadius = 6.0
//        btnSubmit.layer.masksToBounds = true
//        btnCancel.layer.cornerRadius = 6.0
//        btnCancel.layer.masksToBounds = true

    }
    func validated() -> Bool
    {
        var valid: Bool = true

        let name = txtDelivaryName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let desc =  txtDelivaryDesc.text!.trimmingCharacters(in: .whitespacesAndNewlines)


        if name == ""
        {
            self.view.makeToast("Please enter delivary name")
            valid = false
        }else if desc == ""
        {
            self.view.makeToast("Please enter delivary description")
            valid = false
        }
        return valid
    }
}
extension DelivaryTermVC{
    @IBAction func btnClickAdd()
    {
        if validated() == true
        {
            AddDelivaryTermApiCalling()
        }
    }
    @IBAction func btnClickCancel()
    {
        self.dismiss(animated: true, completion: nil)
    }
}

extension DelivaryTermVC{
    func AddDelivaryTermApiCalling()
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)

//        guard let sName = txtsupplierName.text,let address1 = txtAddress1.text,let address2 = txtAddress2.text,
//              let zipcode = txtZipCode.text, let contactPerson = txtcontactPerson.text,
//              let phoneNum = txtphoneNumber.text, let email = txtemailAddress.text else {
//            return
//        }
        var params = [String : Any]()
        params = ["DeliveryTermName":txtDelivaryName.text ?? "","DeliveryTermDescription":txtDelivaryDesc.text ?? ""]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddDeliveryTerm, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
               // self.dismiss(animated: true, completion: nil)
               // self.navigationController?.popViewController(animated: true)
                self.delegate?.delivaryMethod()
                self.dismiss(animated: true, completion: nil)
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}
