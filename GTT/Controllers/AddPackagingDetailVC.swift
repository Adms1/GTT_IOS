//
//  AddPackagingDetailVC.swift
//  GTT
//
//  Created by ADMS on 25/03/22.
//

import UIKit
import MBProgressHUD
import Alamofire
import Toast_Swift


class AddPackagingDetailVC: UIViewController {

    @IBOutlet weak var txtContainerNumber:UITextField!
    @IBOutlet weak var txtSealNumber:UITextField!
    @IBOutlet weak var txtGrossWeight:UITextField!
    @IBOutlet weak var txtNetWeight:UITextField!

    var SupplierShipmentID:Int = 0
    weak var delegate:paymentDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func validated() -> Bool
    {
        var valid: Bool = true

        let ContainerNumber = txtContainerNumber.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let SealNumber =  txtSealNumber.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let GrossWeight =  txtGrossWeight.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let NetWeight =  txtNetWeight.text!.trimmingCharacters(in: .whitespacesAndNewlines)


        if ContainerNumber == ""
        {
            self.view.makeToast("Please enter container number")
            valid = false
        }else if SealNumber == ""
        {
            self.view.makeToast("Please enter seal number")
            valid = false
        }else if GrossWeight == ""
        {
            self.view.makeToast("Please enter  gross weight")
            valid = false
        }
        else if NetWeight == ""
        {
            self.view.makeToast("Please enter net weight")
            valid = false
        }
        return valid
    }
}
extension AddPackagingDetailVC{
    @IBAction func btnClickAdd()
    {
        if validated() == true
        {
            AddSupplierShipmentPackingDetail()
        }
    }
    @IBAction func btnClickCancel()
    {
        self.dismiss(animated: true, completion: nil)
    }
}
extension AddPackagingDetailVC{
    func AddSupplierShipmentPackingDetail()
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)

//        guard let sName = txtsupplierName.text,let address1 = txtAddress1.text,let address2 = txtAddress2.text,
//              let zipcode = txtZipCode.text, let contactPerson = txtcontactPerson.text,
//              let phoneNum = txtphoneNumber.text, let email = txtemailAddress.text else {
//            return
//        }
        var params = [String : Any]()
        params = ["SupplierShipmentID":SupplierShipmentID,"ContainerNumber":txtContainerNumber.text ?? "","SealNumber":txtSealNumber.text ?? "","GrossWeight":txtGrossWeight.text ?? "","NetWeight":txtNetWeight.text ?? "","IsActive":"true","SupplierShipmentPackingDetailID":"0"]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddSupplierShipmentPackingDetail, params: params) { (responceJson) in
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
