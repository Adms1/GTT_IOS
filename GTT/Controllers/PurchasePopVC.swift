//
//  PurchasePopVC.swift
//  GTT
//
//  Created by ADMS on 15/02/22.
//

import UIKit
import DropDown
import MBProgressHUD
import Alamofire

protocol purchaseDelegate:class {
    func passPuchaseObject()
}

class PurchasePopVC: UIViewController {

    @IBOutlet weak var btnMaterial:UIButton!
    @IBOutlet weak var btnCountry:UIButton!
    @IBOutlet weak var txtRate:UITextField!
    @IBOutlet weak var txtQty:UITextField!
    @IBOutlet weak var txtAvgLoading:UITextField!
    @IBOutlet weak var txtPackageType:UITextField!
    @IBOutlet weak var btnPackageType:UIButton!

    @IBOutlet weak var btnSubmit:UIButton!
    @IBOutlet weak var btnCancel:UIButton!

    @IBOutlet weak var btnMaterialPlus:UIButton!
    @IBOutlet weak var btnCountryPlus:UIButton!
    @IBOutlet weak var purchaseVw:UIView!
    @IBOutlet weak var MainPurchaseVw:UIView!

    weak var delegate:purchaseDelegate?

    let dropDown = DropDown()

    var purchaseOrderId = 0
    var materialId = 0
    var currancyId = 0
    var packagingId = 0

    var arrMaterialLiast = [MaterialModel]()
    var arrMaterial = [String]()
    var arrCurrancyList = [CurrencyModel]()
    var arrCurrancy = [String]()
    var arrPackingList = [PackagingModel]()
    var arrPacking = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()

        //        let userDefaults = UserDefaults.standard
        //        purchaseOrderId = userDefaults.value(forKey: "IsPurchaseOrederValue") as! Int
        //        print("purchaseOrderId",purchaseOrderId)
        txtAvgLoading.layer.borderWidth = 0.5
        txtAvgLoading.layer.borderColor = UIColor.black.cgColor
        txtAvgLoading.layer.cornerRadius = 6.0
        txtAvgLoading.layer.masksToBounds = true

        txtQty.layer.borderWidth = 0.5
        txtQty.layer.borderColor = UIColor.black.cgColor
        txtQty.layer.cornerRadius = 6.0
        txtQty.layer.masksToBounds = true


        txtRate.layer.borderWidth = 0.5
        txtRate.layer.borderColor = UIColor.black.cgColor
        txtRate.layer.cornerRadius = 6.0
        txtRate.layer.masksToBounds = true


        btnMaterial.titleEdgeInsets.left = 10
        btnCountry.titleEdgeInsets.left = 10
        btnPackageType.titleEdgeInsets.left = 10



        purchaseVw.layer.cornerRadius = 2.0
        purchaseVw.layer.masksToBounds = true


        btnCountry.layer.cornerRadius = 6.0
        btnCountry.layer.masksToBounds = true
        btnPackageType.layer.cornerRadius = 6.0
        btnPackageType.layer.masksToBounds = true



        btnMaterial.layer.cornerRadius = 6.0
        btnMaterial.layer.masksToBounds = true

        btnCountry.layer.borderWidth = 0.5
        btnCountry.layer.borderColor = UIColor.black.cgColor


        btnPackageType.layer.borderWidth = 0.5
        btnPackageType.layer.borderColor = UIColor.black.cgColor

        btnMaterial.layer.borderWidth = 0.5
        btnMaterial.layer.borderColor = UIColor.black.cgColor

        //        btnSubmit.layer.cornerRadius = 6.0
        //        btnSubmit.layer.masksToBounds = true
        //        btnCancel.layer.cornerRadius = 6.0
        //        btnCancel.layer.masksToBounds = true



    }
    override func viewWillAppear(_ animated: Bool) {
        callMultipleApiCAlling()
    }


    func validated() -> Bool
    {
        var valid: Bool = true

        //   let materialName = btnMaterial.titleLabel?.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //  let materialQty =  txtQty.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        // let packagingType =  btnPackageType.titleLabel?.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        // let materialRate =  txtRate.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        // let materialcurrancy =  btnCountry.titleLabel?.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        // let materialAvgLoading =  txtAvgLoading.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        if btnMaterial.titleLabel?.text == nil
        {
            self.view.makeToast("please enter material name")
            valid = false
        }else if txtQty.text == ""
        {
            self.view.makeToast("please enter contract qty")
            valid = false
        }else if btnPackageType.titleLabel?.text == nil
        {
            self.view.makeToast("please enter material package type")
            valid = false
        }
        else if txtRate.text == ""
        {
            self.view.makeToast("please enter material rate")
            valid = false
        }
        else if btnCountry.titleLabel?.text == nil
        {
            self.view.makeToast("please enter material currancy")
            valid = false
        }
        else if txtAvgLoading.text == ""
        {
            self.view.makeToast("please enter material avg. loading")
            valid = false
        }
        return valid
    }
}
extension PurchasePopVC
{

    @IBAction func chooseMaterial(_ sender: UIButton) {//3
        dropDown.dataSource = arrMaterial//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
            guard let _ = self else { return }
            self?.materialId = self?.arrMaterialLiast[index].MaterialID ?? 0
            sender.setTitle(item, for: .normal) //9
        }

    }

    @IBAction func choosePackaging(_ sender: UIButton) {//3
        dropDown.dataSource = arrPacking//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
            guard let _ = self else { return }
            self?.packagingId = self?.arrPackingList[index].PackagingTypeID ?? 0
            sender.setTitle(item, for: .normal) //9
        }
    }

    @IBAction func chooseCountry(_ sender: UIButton) {//3
        dropDown.dataSource = arrCurrancy//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
            guard let _ = self else { return }
            self?.currancyId = self?.arrCurrancyList[index].CurrencyID ?? 0
            sender.setTitle(item, for: .normal) //9
        }
    }
    @IBAction func btnCancelClick(_sender:UIButton)
    {
        self.dismiss(animated: true, completion: nil)
        // currencyDelagate.cande
    }

    @IBAction func btnSubmitClick(_sender:UIButton)
    {

        if validated() == true
        {
            AddPurchaseMaterialApiCall()
        }
        //        let object = purchseModel(material: (btnMaterial.titleLabel?.text) ?? "", qty: txtQty.text ?? "", country: (btnCountry.titleLabel?.text) ?? "", rate: txtRate.text ?? "", avgLoading: txtAvgLoading.text ?? "")
        //
        //        delegate?.passPuchaseObject(obj: object)
        //
        //        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func btnPlusMaterialClick() {

        self.MainPurchaseVw.isHidden = true
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddMaterialVC") as! AddMaterialVC
        vc.materialDelagate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)

    }

    @IBAction func btnPlusCurrencyClick() {

        self.MainPurchaseVw.isHidden = true
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddCourancyVC") as! AddCourancyVC
        vc.currencyDelagate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)

    }

    @IBAction func btnPlusPackageTypeClick() {

        self.MainPurchaseVw.isHidden = true
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        vc.delegate1 = self
        vc.strPopText = "Package Type"
        vc.strPopHeaderTitle = "Package Type Name"
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)

    }

}
extension PurchasePopVC
{

    func AddPurchaseMaterialApiCall()
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)

        //        guard let sName = txtsupplierName.text,let address1 = txtAddress1.text,let address2 = txtAddress2.text,
        //              let zipcode = txtZipCode.text, let contactPerson = txtcontactPerson.text,
        //              let phoneNum = txtphoneNumber.text, let email = txtemailAddress.text else {
        //            return
        //        }
        var params = [String : Any]()
        params = ["PurchseOrderMaterialID":"0","PurchaseOrderID":purchaseOrderId,"MaterialID":materialId,"ContractQuantity":txtQty.text ?? 0,"RatePerMT":txtRate.text ?? 0,"CurrencyID":currancyId as Any,"AverageLoading":txtAvgLoading.text ?? 0,"PackagingID":packagingId]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddPurchaseOrderMaterial, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.delegate?.passPuchaseObject()
                self.dismiss(animated: true, completion: nil)
                //self.navigationController?.popViewController(animated: true)
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }


    func callMultipleApiCAlling()
    {
        self.arrCurrancy.removeAll()
        self.arrCurrancyList.removeAll()

        self.arrMaterial.removeAll()
        self.arrMaterialLiast.removeAll()

        self.arrPacking.removeAll()
        self.arrPackingList.removeAll()

        let dispetchGroup = DispatchGroup()
        MBProgressHUD.showAdded(to: self.view, animated: true)

        dispetchGroup.enter()
        print("GetSupplierListApiCalling")


        ApiHttpUtility.sharedUHttp.callGetMultipleApiHttpUtility(urlString: API.GetMaterialList) { (responceJson, error) in
            if(responceJson?[Constants.Status] == "Success")
            {
                // self.getCityListApiCalling()
                let arrData = responceJson?["Data"].array
                for value in arrData! {

                    let state:MaterialModel = MaterialModel.init(MaterialID: value["MaterialID"].intValue, MaterialName: value["MaterialName"].stringValue, HSNCode: value["HSNCode"].stringValue)

                    self.arrMaterial.append(value["MaterialName"].stringValue)
                    self.arrMaterialLiast.append(state)
                }
                dispetchGroup.leave()
                // lock.unlock()
            }
        }


        dispetchGroup.enter()
        print("GetEquipmentList")


        ApiHttpUtility.sharedUHttp.callGetMultipleApiHttpUtility(urlString: API.GetPackagingTypeList) { (responceJson, error) in
            if(responceJson?[Constants.Status] == "Success")
            {
                // MBProgressHUD.hide(for: self.view, animated: true)

                // self.getCityListApiCalling()
                let arrData = responceJson?["Data"].array
                for value in arrData! {

                    let state:PackagingModel = PackagingModel.init(PackagingTypeID: value["PackagingTypeID"].intValue, PackagingTypeName: value["PackagingTypeName"].stringValue)
                    self.arrPacking.append(value["PackagingTypeName"].stringValue)
                    self.arrPackingList.append(state)
                }
                dispetchGroup.leave()
                //  lock.unlock()
            }else
            {
                //                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }

        dispetchGroup.enter()
        print("GetCountryList")



        ApiHttpUtility.sharedUHttp.callGetMultipleApiHttpUtility(urlString: API.GetCurrencyList) { (responceJson, error) in
            if(responceJson?[Constants.Status] == "Success")
            {
                // MBProgressHUD.hide(for: self.view, animated: true)
                print(responceJson)
                // self.getStateListApiCalling()

                let arrData = responceJson?["Data"].array
                for value in arrData! {

                    let country:CurrencyModel = CurrencyModel.init(CurrencyID: value["CurrencyID"].intValue, CurrencyName: value["CurrencyName"].stringValue)
                    self.arrCurrancy.append(value["CurrencyName"].stringValue)
                    self.arrCurrancyList.append(country)
                }
                dispetchGroup.leave()
            }else
            {
                //                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }



        dispetchGroup.notify(queue: .main) {
            MBProgressHUD.hide(for: self.view, animated: true)
            print("all task done")
        }
    }
}
extension PurchasePopVC:AddMaterialDelegate,AddCurrencyDelegate,packageDelegate
{
    func CancelAddPackagDelegate() {
        self.MainPurchaseVw.isHidden = false
    }

    func setAddPackagDelegate() {
        self.MainPurchaseVw.isHidden = false
        callMultipleApiCAlling()
    }

    func addAddCurrencyDelegate() {
        self.MainPurchaseVw.isHidden = false
        callMultipleApiCAlling()
    }

    func CancelAddCurrencyDelegate() {
        self.MainPurchaseVw.isHidden = false
    }

    func addMarial() {
        self.MainPurchaseVw.isHidden = false
        callMultipleApiCAlling()
    }

    func CancelMaterial() {
        self.MainPurchaseVw.isHidden = false
    }
}

