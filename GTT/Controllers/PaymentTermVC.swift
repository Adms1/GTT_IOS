//
//  PaymentTermVC.swift
//  GTT
//
//  Created by ADMS on 21/02/22.
//

import UIKit
import MBProgressHUD
import Alamofire
import Toast_Swift

protocol paymentDelegate:class {
    func paymentMethod()
}

class PaymentTermVC: UIViewController {
    
    @IBOutlet weak var btnSubmit:UIButton!
    @IBOutlet weak var btnCancel:UIButton!
    @IBOutlet weak var txtPaymentName:UITextField!
    @IBOutlet weak var txtPaymentDesc:UITextField!
    @IBOutlet weak var txtAdvance:UITextField!

    weak var delegate:paymentDelegate?
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

        let name = txtPaymentName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let desc =  txtPaymentDesc.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let advance =  txtAdvance.text!.trimmingCharacters(in: .whitespacesAndNewlines)


        if name == ""
        {
            self.view.makeToast("Please enter payment name")
            valid = false
        }else if desc == ""
        {
            self.view.makeToast("Please enter payment description")
            valid = false
        }else if advance == ""
        {
            self.view.makeToast("Please enter advance percentage")
            valid = false
        }
        return valid
    }
}
extension PaymentTermVC{
    @IBAction func btnClickAdd()
    {
        if validated() == true
        {
            AddPaymentTermApiCalling()
        }
    }
    @IBAction func btnClickCancel()
    {
        self.dismiss(animated: true, completion: nil)
    }
}
extension PaymentTermVC{
    func AddPaymentTermApiCalling()
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)

//        guard let sName = txtsupplierName.text,let address1 = txtAddress1.text,let address2 = txtAddress2.text,
//              let zipcode = txtZipCode.text, let contactPerson = txtcontactPerson.text,
//              let phoneNum = txtphoneNumber.text, let email = txtemailAddress.text else {
//            return
//        }
        var params = [String : Any]()
        params = ["PaymentTermName":txtPaymentName.text ?? "","PaymentTermDescription":txtPaymentDesc.text ?? "","Advance":txtAdvance.text ?? ""]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddPaymentTerm, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
               // self.dismiss(animated: true, completion: nil)
               // self.navigationController?.popViewController(animated: true)
                self.delegate?.paymentMethod()
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
