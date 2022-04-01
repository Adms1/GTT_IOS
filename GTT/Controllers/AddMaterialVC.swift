//
//  AddMaterialVC.swift
//  GTT
//
//  Created by ADMS on 21/02/22.
//

import UIKit
import MBProgressHUD
import Toast_Swift

protocol AddMaterialDelegate: class {
    func addMarial()
    func CancelMaterial()
}

class AddMaterialVC: UIViewController {

    weak var materialDelagate:AddMaterialDelegate?
    @IBOutlet weak var btnSubmit:UIButton!
    @IBOutlet weak var btnCancel:UIButton!

    @IBOutlet weak var txtMaterialName:UITextField!
    @IBOutlet weak var txtMaterialDesc:UITextField!
    @IBOutlet weak var txtMaterialHsnCode:UITextField!
    
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

        let materialName = txtMaterialName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let materialDesc =  txtMaterialDesc.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let mterialHsnCode =  txtMaterialHsnCode.text!.trimmingCharacters(in: .whitespacesAndNewlines)


        if materialName == ""
        {
            self.view.makeToast("please enter material name")
            valid = false
        }else if materialDesc == ""
        {
            self.view.makeToast("please enter material description")
            valid = false
        }else if mterialHsnCode == ""
        {
            self.view.makeToast("please enter material HSN Code")
            valid = false
        }
        return valid
    }
}
extension AddMaterialVC{
    @IBAction func btnClickAdd()
    {
        if validated() == true{
            addMaterialApiCall()
        }

       // self.dismiss(animated: true, completion: nil)
       // materialDelagate?.addMarial()
    }
    @IBAction func btnClickCancel()
    {
        self.dismiss(animated: true, completion: nil)
        materialDelagate?.CancelMaterial()
    }
}
extension AddMaterialVC{
    func addMaterialApiCall()
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)

        guard let materialName = txtMaterialName.text, let materialDesc = txtMaterialDesc.text, let materialHsnCode = txtMaterialHsnCode.text  else {
            return
        }
        var params = [String : Any]()
        params = ["MaterialName":materialName,"MaterialDescription":materialDesc,"HSNCode":materialHsnCode]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddMaterial, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.materialDelagate?.addMarial()
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
