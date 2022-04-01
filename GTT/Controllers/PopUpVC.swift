//
//  PopUpVC.swift
//  GTT
//
//  Created by ADMS on 21/02/22.
//

import UIKit
import MBProgressHUD
import Toast_Swift

protocol packageDelegate:class {
    func CancelAddPackagDelegate()
    func setAddPackagDelegate()
}

protocol supplierDelegate:class {
    func passSupplierModelObject()
}

class PopUpVC: UIViewController {

    @IBOutlet weak var txtHeaderTitle:UILabel!
    @IBOutlet weak var txtName:UITextField!
    @IBOutlet weak var btnSubmit:UIButton!
    @IBOutlet weak var btnCancel:UIButton!

    @IBOutlet weak var purchaseVw:UIView!

    @IBOutlet weak var popupText:UILabel!

    var strPopText:String?
    var strPopHeaderTitle:String?

    var strStateId:Int = 0
    var strCountryID:Int = 0
    var strCountryPortId:Int = 0

    weak var delegate:supplierDelegate?
    weak var delegate1:packageDelegate?



    override func viewDidLoad() {
        super.viewDidLoad()

        popupText.text = strPopText ?? ""
        txtHeaderTitle.text = strPopHeaderTitle ?? ""

//        btnSubmit.layer.cornerRadius = 6.0
//        btnSubmit.layer.masksToBounds = true
//
//        btnCancel.layer.cornerRadius = 6.0
//        btnCancel.layer.masksToBounds = true



    }
    func validated() -> Bool
    {
        var valid: Bool = true

        let strname = txtName.text!.trimmingCharacters(in: .whitespacesAndNewlines)


        if strname == ""
        {
            self.view.makeToast("Please Enter \(strPopText ?? "")")
//            let toast =  Toast(text: (NSLocalizedString("Digo_error_msg1", comment: "")), duration: 3.0)
//            toast.show()


            valid = false
        }
        return valid
    }
}
extension PopUpVC
{
    @IBAction func btnSubmitClick(_sender:UIButton)
    {

        if strPopText == "Package Type"{
            if validated() == true{
                addPackageTypeClick()
            }
        }
        else if strPopText == "Shipment Line"{
            if validated() == true{
                AddShipmentLine()
            }
        }
        else if strPopText == "Country Name"{
            if validated() == true{
                addCountryApiCall()
            }
        }
        else if strPopText == "Country Name"{
            if validated() == true{
                addCountryApiCall()
            }
        }
        else if strPopText == "Country Name"{
            if validated() == true{
                addCountryApiCall()
            }
        }
        else if strPopText == "Port Name"{
            if validated() == true{
                AddCountryPortApiCall()
            }
        }
        else if strPopText == "Port Dischange"{
            if validated() == true{
                AddCountryPortApiCall()
            }
        }


        else if strPopText == "Country Name"{
            if validated() == true{
                addCountryApiCall()
            }
        }

        else if strPopText == "State Name"{
            if validated() == true{
                AddCountryStateApiCall()
            }
        }
        else if strPopText == "City Name"{
            if validated() == true{
                AddCountryStateCityApiCall()
            }
        }

        else if strPopText == "Equipment Name"{
            if validated() == true{
                AddEquipmentApiCall()
            }
        }
        else if strPopText == "Place Name"{
            if validated() == true{
                AddCountryPortPlaceApiCall()
            }
        }


      //  let object = supplierModel(supplier: )
        //delegate?.passSupplierModelObject(obj: txtName.text ?? "", CompareText: strPopHeaderTitle ?? "")
        //self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnCancelClick(_sender:UIButton)
    {
        self.dismiss(animated: true, completion: nil)
        delegate1?.CancelAddPackagDelegate()
    }
}
extension PopUpVC
{
    func addPackageTypeClick()
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)

        guard let globleName = txtName.text  else {
            return
        }
        var params = [String : Any]()
        params = ["PackagingTypeName":globleName]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddPackagingType, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
//                self.delegate?.passSupplierModelObject()
                self.delegate1?.setAddPackagDelegate()
                self.dismiss(animated: true, completion: nil)
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }


    func AddShipmentLine()
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)

        guard let globleName = txtName.text  else {
            return
        }
        var params = [String : Any]()
        params = ["ShippingLineName":globleName,"IsActive":"true"]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddShippingLine, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.delegate?.passSupplierModelObject()
                self.dismiss(animated: true, completion: nil)
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }

    func addCountryApiCall()
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)

        guard let globleName = txtName.text  else {
            return
        }
        var params = [String : Any]()
        params = ["countryName":globleName]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddCountry, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.delegate?.passSupplierModelObject()
                self.dismiss(animated: true, completion: nil)
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    func AddCountryStateApiCall()
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)

        guard let globleName = txtName.text  else {
            return
        }
        var params = [String : Any]()
        params = ["countryID":strCountryID,"stateName":globleName]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddCountryState, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.delegate?.passSupplierModelObject()
                self.dismiss(animated: true, completion: nil)
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    func AddCountryStateCityApiCall()
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)

        guard let globleName = txtName.text  else {
            return
        }
        var params = [String : Any]()
        params = ["countryStateID":strStateId,"CityName":globleName]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddCountryStateCity, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.delegate?.passSupplierModelObject()
                self.dismiss(animated: true, completion: nil)
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    func AddCountryPortApiCall()
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)

        guard let globleName = txtName.text  else {
            return
        }
        var params = [String : Any]()
        params = ["portName":globleName,"countryID":strCountryID]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddCountryPort, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.delegate?.passSupplierModelObject()
                self.dismiss(animated: true, completion: nil)
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    func AddCountryPortPlaceApiCall()
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)

        guard let globleName = txtName.text  else {
            return
        }
        var params = [String : Any]()
        params = ["portPlaceName":globleName,"countryPortID":strCountryPortId]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddCountryPortPlace, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.delegate?.passSupplierModelObject()
                self.dismiss(animated: true, completion: nil)
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    func AddEquipmentApiCall()
    {

      //  MBProgressHUD.showAdded(to: self.view, animated: true)

        guard let globleName = txtName.text  else {
            return
        }
        var params = [String : Any]()
        params = ["EquipmentName":globleName]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddEquipment, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
//                MBProgressHUD.hide(for: self.view, animated: true)
                self.delegate?.passSupplierModelObject()
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
