//
//  PurchaseOrderVC2.swift
//  GTT
//
//  Created by ADMS on 15/02/22.
//

import UIKit
import DropDown
import MBProgressHUD

class PurchaseOrderVC2: UIViewController {

    @IBOutlet weak var btnCountryOrigin:UIButton!
    @IBOutlet weak var btnContryLoading:UIButton!
    @IBOutlet weak var btnPortLoading:UIButton!
    @IBOutlet weak var btnCountryDelivary:UIButton!
    @IBOutlet weak var btnPortDischange:UIButton!
    @IBOutlet weak var btnPlaceDelivary:UIButton!
    @IBOutlet weak var btnPaymentsTerms:UIButton!
    @IBOutlet weak var btnDelivaryTerms:UIButton!


    @IBOutlet weak var btnPlusCountryOrigin:UIButton!
    @IBOutlet weak var btnPlusCountryLoading:UIButton!
    @IBOutlet weak var btnPlusPortLoading:UIButton!
    @IBOutlet weak var btnPlusCountryDelivary:UIButton!
    @IBOutlet weak var btnPlusPortDischange:UIButton!
    @IBOutlet weak var btnPlusPlaceDelivary:UIButton!
    @IBOutlet weak var btnPlusPT:UIButton!
    @IBOutlet weak var btnPlusDT:UIButton!
    @IBOutlet weak var btnPicsReceive:UIButton!

    @IBOutlet weak var btnSupplier:UIButton!
    @IBOutlet weak var txtSupplierContract:UITextField!
    @IBOutlet weak var btnSupplierPlus:UIButton!

    @IBOutlet weak var btnEquitment:UIButton!
    @IBOutlet weak var btnEquitmentPlus:UIButton!



    @IBOutlet weak var txtGridNumber:UITextField!
    @IBOutlet weak var txtGridYear:UITextField!
    @IBOutlet weak var txtTolerance:UITextField!
    @IBOutlet weak var txtEquitpmentCount:UITextField!


    @IBOutlet weak var btnSubmit:UIButton!

    var strCountryLoading:Int = 0
    var strCountryDeliPortDischarge:Int = 0
    var PortofDischargeID:Int = 0
    var countryFindPlaceId:Int = 0
    var strCountryDelivary:Int = 0
    var strCountryPortLoadingId:Int = 0
    var equipmentTypeID:Int = -1
    var supplierID:Int = -1


    var paymentTermID:Int = -1
    var delivaryTermId:Int = -1


    var arrEquitment = [String]()
    var arrEquitmentList = [equipmentModel]()

    var arrSupplier = [String]()
    var arrSupplierList = [supplierModel]()

    let dropDown = DropDown()
    var arrCountryList = [countryModel]()
    var arrCountry = [String]()

    var arrPortList = [findPlacePortModel]()
    var arrPort = [String]()

    var arrDisPortList = [findPlacePortModel]()
    var arrDisPort = [String]()


    var arrFindPlaceList = [findPlacePortModel1]()
    var arrFindPlace = [String]()

//    var arrPlaceList = [portPlaceListModel]()
//    var arrPlace = [String]()



    var arrDelivaryTermList = [delivaryTermModel]()
    var arrDelivaryTerm = [String]()

    var arrPaymentTermList = [paymentTermModel]()
    var arrPaymentTerm = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()

        txtGridYear.layer.borderWidth = 0.5
        txtGridYear.layer.borderColor = UIColor.black.cgColor
        txtGridYear.layer.cornerRadius = 6.0
        txtGridYear.layer.masksToBounds = true


        txtGridNumber.layer.borderWidth = 0.5
        txtGridNumber.layer.borderColor = UIColor.black.cgColor
        txtGridNumber.layer.cornerRadius = 6.0
        txtGridNumber.layer.masksToBounds = true

        txtSupplierContract.layer.borderWidth = 0.5
        txtSupplierContract.layer.borderColor = UIColor.black.cgColor
        txtSupplierContract.layer.cornerRadius = 6.0
        txtSupplierContract.layer.masksToBounds = true

        txtEquitpmentCount.layer.borderWidth = 0.5
        txtEquitpmentCount.layer.borderColor = UIColor.black.cgColor
        txtEquitpmentCount.layer.cornerRadius = 6.0
        txtEquitpmentCount.layer.masksToBounds = true

        txtTolerance.layer.borderWidth = 0.5
        txtTolerance.layer.borderColor = UIColor.black.cgColor
        txtTolerance.layer.cornerRadius = 6.0
        txtTolerance.layer.masksToBounds = true


        txtGridNumber.isUserInteractionEnabled = false
        txtGridYear.isUserInteractionEnabled = false
        
        btnSupplier.titleEdgeInsets.left = 10
        btnEquitment.titleEdgeInsets.left = 10
        btnCountryOrigin.titleEdgeInsets.left = 10
        btnContryLoading.titleEdgeInsets.left = 10
        btnContryLoading.titleEdgeInsets.left = 10
        btnPortLoading.titleEdgeInsets.left = 10

        btnCountryDelivary.titleEdgeInsets.left = 10
        btnPortDischange.titleEdgeInsets.left = 10
        btnPlaceDelivary.titleEdgeInsets.left = 10
        btnPaymentsTerms.titleEdgeInsets.left = 10
        btnDelivaryTerms.titleEdgeInsets.left = 10
//        btnPortLoading.titleEdgeInsets.left = 10


        txtTolerance.text = "10"
       // headerVw.lblnavigationTitle.text = "Purchase Order"

        btnSupplier.layer.cornerRadius = 6.0
        btnSupplier.layer.masksToBounds = true

        btnSupplier.layer.borderWidth = 0.5
        btnSupplier.layer.borderColor = UIColor.black.cgColor

        btnEquitment.layer.cornerRadius = 6.0
        btnEquitment.layer.masksToBounds = true

        btnEquitment.layer.borderWidth = 0.5
        btnEquitment.layer.borderColor = UIColor.black.cgColor



        btnCountryOrigin.layer.cornerRadius = 6.0
        btnCountryOrigin.layer.masksToBounds = true

        btnCountryOrigin.layer.borderWidth = 0.5
        btnCountryOrigin.layer.borderColor = UIColor.black.cgColor


        btnContryLoading.layer.cornerRadius = 6.0
        btnContryLoading.layer.masksToBounds = true

        btnContryLoading.layer.borderWidth = 0.5
        btnContryLoading.layer.borderColor = UIColor.black.cgColor


        btnPortLoading.layer.cornerRadius = 6.0
        btnPortLoading.layer.masksToBounds = true

        btnPortLoading.layer.borderWidth = 0.5
        btnPortLoading.layer.borderColor = UIColor.black.cgColor


        btnCountryDelivary.layer.cornerRadius = 6.0
        btnCountryDelivary.layer.masksToBounds = true

        btnCountryDelivary.layer.borderWidth = 0.5
        btnCountryDelivary.layer.borderColor = UIColor.black.cgColor


        btnPortDischange.layer.cornerRadius = 6.0
        btnPortDischange.layer.masksToBounds = true

        btnPortDischange.layer.borderWidth = 0.5
        btnPortDischange.layer.borderColor = UIColor.black.cgColor


        btnPlaceDelivary.layer.cornerRadius = 6.0
        btnPlaceDelivary.layer.masksToBounds = true

        btnPlaceDelivary.layer.borderWidth = 0.5
        btnPlaceDelivary.layer.borderColor = UIColor.black.cgColor


        btnPaymentsTerms.layer.cornerRadius = 6.0
        btnPaymentsTerms.layer.masksToBounds = true

        btnPaymentsTerms.layer.borderWidth = 0.5
        btnPaymentsTerms.layer.borderColor = UIColor.black.cgColor


        btnDelivaryTerms.layer.cornerRadius = 6.0
        btnDelivaryTerms.layer.masksToBounds = true

        btnDelivaryTerms.layer.borderWidth = 0.5
        btnDelivaryTerms.layer.borderColor = UIColor.black.cgColor

//        btnSubmit.layer.cornerRadius = 6.0
//        btnSubmit.layer.masksToBounds = true

    }

    override func viewWillAppear(_ animated: Bool) {
        callMultipleApiCAlling()
//        GetEquipmentListApiCalling()
//        getCountryListApiCalling()
//        GetSupplierListApiCalling()
    }


    func validated() -> Bool
    {
        var valid: Bool = true
        if btnSupplier.titleLabel?.text == nil
        {
            self.view.makeToast("please select supplier name")
            valid = false
        }else if txtSupplierContract.text == ""
        {
            self.view.makeToast("please enter supplier contract number")
            valid = false
        }else if btnEquitment.titleLabel?.text == nil
        {
            self.view.makeToast("please select equitment type")
            valid = false
        }
        else if txtEquitpmentCount.text == ""
        {
            self.view.makeToast("please enter equitment count")
            valid = false
        }
        else if txtTolerance.text == ""
        {
            self.view.makeToast("please enter tolerance")
            valid = false
        }
        else if btnCountryOrigin.titleLabel?.text == nil
        {
            self.view.makeToast("please enter country of origin")
            valid = false
        }
        else if btnContryLoading.titleLabel?.text == nil
        {
            self.view.makeToast("please enter country of loading")
            valid = false
        }
        else if btnPortLoading.titleLabel?.text == nil
        {
            self.view.makeToast("please enter port of  loading")
            valid = false
        }
        else if btnCountryDelivary.titleLabel?.text == nil
        {
            self.view.makeToast("please enter country of delivary")
            valid = false
        }
        else if btnPortDischange.titleLabel?.text == nil
        {
            self.view.makeToast("please enter port of dischange")
            valid = false
        }
        else if btnPlaceDelivary.titleLabel?.text == nil
        {
            self.view.makeToast("please enter place of delivary")
            valid = false
        }
        else if btnPaymentsTerms.titleLabel?.text == nil
        {
            self.view.makeToast("please enter payment terms")
            valid = false
        }
        else if btnDelivaryTerms.titleLabel?.text == nil
        {
            self.view.makeToast("please enter delivary terms")
            valid = false
        }
        return valid
    }
    
}
extension PurchaseOrderVC2{
    @IBAction func btnClickBAck()
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnClickSubmit()
    {

        if validated() == true
        {
            AddPurchaseOrderApiCalling()
        }


//        let  vc =  self.navigationController?.viewControllers.filter({$0 is OrderVC}).first
//        self.navigationController?.popToViewController(vc!, animated: true)
    }
    @IBAction func btnClickSupplier(_ sender:UIButton)
    {
        dropDown.dataSource = arrSupplier//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
            self!.supplierID = self?.arrSupplierList[index].SupplierID ?? 0
          sender.setTitle(item, for: .normal) //9
           // self?.getStateListApiCalling()
        }

    }
    @IBAction func btnClickSupplierPlus(_sender:UIButton)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SupplierVC") as! SupplierVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnClickEquitmentPlus()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        vc.delegate = self
        vc.strPopHeaderTitle = "Equipment"
        vc.strPopText = "Equipment Name"
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnClickEquitment(_ sender : UIButton)
    {
        dropDown.dataSource = arrEquitment//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
            self!.equipmentTypeID = self?.arrEquitmentList[index].EquipmentTypeID ?? 0
          sender.setTitle(item, for: .normal) //9
           // self?.getStateListApiCalling()
        }
    }
    @IBAction func btnClickPaymentTerm()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PaymentTermVC") as! PaymentTermVC
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnClickDelivaryTerm()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DelivaryTermVC") as! DelivaryTermVC
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnClickCountryLoadingList(_ sender:UIButton)
    {
        dropDown.dataSource = arrCountry//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
            self!.strCountryLoading = self?.arrCountryList[index].CountryID ?? 0
          sender.setTitle(item, for: .normal) //9
            self?.GetCountryPortListApiCalling()
        }
    }
    @IBAction func btnCouLoading()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        vc.strPopHeaderTitle = "Country of Loading"
        vc.strPopText = "Country Name"
        vc.strCountryID = strCountryLoading
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnClickCountryOriginList(_ sender:UIButton)
    {
        dropDown.dataSource = arrCountry//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
           // self!.str = self?.arrCountryList[index].CountryID ?? 0
          sender.setTitle(item, for: .normal) //9
        }
    }
    @IBAction func btnCouOrigin(_ sender : UIButton)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        vc.strPopHeaderTitle = "Country of Origin"
        vc.strPopText = "Country Name"
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnCouPortDischange()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        vc.strCountryID = strCountryDeliPortDischarge
        vc.strPopHeaderTitle = "Port of Dischange"
        vc.strPopText = "Port Dischange"
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnClickCountryPortDischarge(_ sender:UIButton)
    {
        dropDown.dataSource = arrDisPort//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
            self!.PortofDischargeID = self?.arrDisPortList[index].CountryPortID ?? 0
          sender.setTitle(item, for: .normal) //9
            self?.GetCountryFindPlaceApiCalling()
        }
    }
    @IBAction func btnClickCountryFindPlaceDeelivary(_ sender:UIButton)
    {
        dropDown.dataSource = arrFindPlace//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
            self!.countryFindPlaceId = self?.arrFindPlaceList[index].CountryPortPlaceID ?? 0
          sender.setTitle(item, for: .normal) //9
        }
    }
    @IBAction func btnConDelivary()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        vc.strPopHeaderTitle = "Country of Delivary"
        vc.strPopText = "Country Name"
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnClickCountryDelivaryList(_ sender:UIButton)
    {
        dropDown.dataSource = arrCountry //4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
            self!.strCountryDeliPortDischarge = self?.arrCountryList[index].CountryID ?? 0
          sender.setTitle(item, for: .normal) //9
            self?.GetCountryDisChargePortListApiCalling()
        }
    }
    @IBAction func btnConFindPlaceDelivary()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        vc.strCountryPortId = PortofDischargeID
        vc.strPopHeaderTitle = "Place of Delivary"
        vc.strPopText = "Place Name"
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnConPortLoading()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        vc.strCountryID = strCountryLoading
        vc.strPopHeaderTitle = "Port of Loading"
        vc.strPopText = "Port Name"
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnClickCountryPortLoadingList(_ sender:UIButton)
    {
        dropDown.dataSource = arrPort//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
            self!.strCountryPortLoadingId = self?.arrPortList[index].CountryPortID ?? 0
          sender.setTitle(item, for: .normal) //9
        }
    }

    @IBAction func btnClickPaymnetTermList(_ sender:UIButton)
    {
        dropDown.dataSource = arrPaymentTerm//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
            self!.paymentTermID = self?.arrPaymentTermList[index].PaymentTermID ?? 0
          sender.setTitle(item, for: .normal) //9
        }
    }

    @IBAction func btnClickDelivaryTermList(_ sender:UIButton)
    {
        dropDown.dataSource = arrDelivaryTerm//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
            self!.delivaryTermId = self?.arrDelivaryTermList[index].DeliveryTermID ?? 0
          sender.setTitle(item, for: .normal) //9
        }
    }
}
extension PurchaseOrderVC2:supplierDelegate,paymentDelegate,delivaryDelegate
{
    func delivaryMethod() {
        callMultipleApiCAlling()
    }
    func paymentMethod() {
        callMultipleApiCAlling()
    }
    func passSupplierModelObject() {
        callMultipleApiCAlling()
        GetCountryPortListApiCalling()
        GetCountryDisChargePortListApiCalling()
        GetCountryFindPlaceApiCalling()
    }
}

extension PurchaseOrderVC2
{
    func callMultipleApiCAlling()
    {
        self.arrCountry.removeAll()
        self.arrCountryList.removeAll()

        self.arrSupplierList.removeAll()
        self.arrEquitmentList.removeAll()

        self.arrEquitment.removeAll()
        self.arrSupplier.removeAll()

        let dispetchGroup = DispatchGroup()
        MBProgressHUD.showAdded(to: self.view, animated: true)

        dispetchGroup.enter()
        print("GetSupplierListApiCalling")


        ApiHttpUtility.sharedUHttp.callGetMultipleApiHttpUtility(urlString: API.GetSupplierList) { (responceJson, error) in
            if(responceJson?[Constants.Status] == "Success")
            {
               // self.getCityListApiCalling()
                let arrData = responceJson?["Data"].array
                for value in arrData! {

                    let state:supplierModel = supplierModel.init(supplierID: value["SupplierID"].intValue, supplierName: value["SupplierName"].stringValue)
                    self.arrSupplier.append(value["SupplierName"].stringValue)
                    self.arrSupplierList.append(state)
                }
                dispetchGroup.leave()
               // lock.unlock()
            }
        }


        dispetchGroup.enter()
        print("GetEquipmentList")


        ApiHttpUtility.sharedUHttp.callGetMultipleApiHttpUtility(urlString: API.GetEquipmentList) { (responceJson, error) in
            if(responceJson?[Constants.Status] == "Success")
            {
               // MBProgressHUD.hide(for: self.view, animated: true)

               // self.getCityListApiCalling()
                let arrData = responceJson?["Data"].array
                for value in arrData! {

                    let state:equipmentModel = equipmentModel.init(equipmentTypeID: value["EquipmentTypeID"].intValue, equipmenttypename: value["Equipmenttypename"].stringValue)
                    self.arrEquitment.append(value["Equipmenttypename"].stringValue)
                    self.arrEquitmentList.append(state)
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



        ApiHttpUtility.sharedUHttp.callGetMultipleApiHttpUtility(urlString: API.GetCountryList) { (responceJson, error) in
            if(responceJson?[Constants.Status] == "Success")
            {
               // MBProgressHUD.hide(for: self.view, animated: true)
                print(responceJson)
               // self.getStateListApiCalling()

                let arrData = responceJson?["Data"].array
                for value in arrData! {

                    let country:countryModel = countryModel.init(countryName: value["CountryName"].stringValue, countryID: value["CountryID"].intValue)
                    self.arrCountry.append(value["CountryName"].stringValue)
                    self.arrCountryList.append(country)
                }
                dispetchGroup.leave()
            }else
            {
//                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }

        dispetchGroup.enter()
        print("GetPOGridNumberGridYear")

        ApiHttpUtility.sharedUHttp.callGetMultipleApiHttpUtility(urlString: API.GetPOGridNumberGridYear) { (responceJson, error) in
            if(responceJson?[Constants.Status] == "Success")
            {
                print(responceJson)
                let arrData = responceJson?["Data"].array
                for value in arrData!

                {
                    self.txtGridYear.text = "\(value["GridYear"].stringValue)"
                    self.txtGridNumber.text = "\(value["GridNumber"].stringValue)"
                }
                dispetchGroup.leave()
            }else
            {
//                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }


        dispetchGroup.enter()
        print("GetPaymentTermList")

        ApiHttpUtility.sharedUHttp.callGetMultipleApiHttpUtility(urlString: API.GetPaymentTermList) { (responceJson, error) in
            if(responceJson?[Constants.Status] == "Success")
            {
                print(responceJson)
                let arrData = responceJson?["Data"].array
                for value in arrData! {

                    let country:paymentTermModel = paymentTermModel.init(paymentTermID: value["PaymentTermID"].intValue, paymentTermName: value["PaymentTermName"].stringValue)
                    self.arrPaymentTerm.append(value["PaymentTermName"].stringValue)
                    self.arrPaymentTermList.append(country)
                }

                dispetchGroup.leave()
            }else
            {
//                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }

        dispetchGroup.enter()
        print("GetDeliveryTermList")

        ApiHttpUtility.sharedUHttp.callGetMultipleApiHttpUtility(urlString: API.GetDeliveryTermList) { (responceJson, error) in
            if(responceJson?[Constants.Status] == "Success")
            {
                print(responceJson)
                let arrData = responceJson?["Data"].array
                for value in arrData! {

                    let country:delivaryTermModel = delivaryTermModel.init(deliveryTermID: value["DeliveryTermID"].intValue, deliveryName: value["DeliveryName"].stringValue)
                    self.arrDelivaryTerm.append(value["DeliveryName"].stringValue)
                    self.arrDelivaryTermList.append(country)
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

    func GetCountryPortListApiCalling()
    {
        self.arrPort.removeAll()
        self.arrPortList.removeAll()

        MBProgressHUD.showAdded(to: self.view, animated: true)
        var params = [String : Any]()
        params = ["countryID":strCountryLoading]

        ApiHttpUtility.sharedUHttp.callPostMultipleApiHttpUtility(urlString: API.GetCountryPortList, params: params) { (responceJson, error) in
            if(responceJson?[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)

                if let error = error {
                    print(error.localizedDescription)
                    return
                }

                print(responceJson)
               // self.getStateListApiCalling()

                let arrData = responceJson?["Data"].array
                for value in arrData! {

                    let country:findPlacePortModel = findPlacePortModel.init(countryPortID: value["CountryPortID"].intValue, countryID: value["countryID"].intValue, PortName: value["PortName"].stringValue)
                  //  self.arrFindPlace.append(value["PortName"].stringValue)


                    self.arrPort.append(value["PortName"].stringValue)
                    self.arrPortList.append(country)
                }
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
    }

    func GetCountryDisChargePortListApiCalling()
    {
        self.arrDisPort.removeAll()
        self.arrDisPortList.removeAll()

        MBProgressHUD.showAdded(to: self.view, animated: true)
        var params = [String : Any]()
        params = ["countryID":strCountryDeliPortDischarge]

        ApiHttpUtility.sharedUHttp.callPostMultipleApiHttpUtility(urlString: API.GetCountryPortList, params: params) { (responceJson, error) in
            if(responceJson?[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)

                if let error = error {
                    print(error.localizedDescription)
                    return
                }

                print(responceJson)
               // self.getStateListApiCalling()

                let arrData = responceJson?["Data"].array
                for value in arrData! {

                    let country:findPlacePortModel = findPlacePortModel.init(countryPortID: value["CountryPortID"].intValue, countryID: value["countryID"].intValue, PortName: value["PortName"].stringValue)
                  //  self.arrFindPlace.append(value["PortName"].stringValue)


                    self.arrDisPort.append(value["PortName"].stringValue)
                    self.arrDisPortList.append(country)
                }
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
    }

    func GetCountryFindPlaceApiCalling()
    {
        self.arrFindPlace.removeAll()
        self.arrFindPlaceList.removeAll()

        MBProgressHUD.showAdded(to: self.view, animated: true)
        var params = [String : Any]()
        params = ["countryPortID":PortofDischargeID]

        ApiHttpUtility.sharedUHttp.callPostMultipleApiHttpUtility(urlString: API.GetCountryPortPlaceList, params: params) { (responceJson, error) in
            if(responceJson?[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)

                if let error = error {
                    print(error.localizedDescription)
                    return
                }

                print(responceJson)
               // self.getStateListApiCalling()

                let arrData = responceJson?["Data"].array
                for value in arrData! {

                    let country:findPlacePortModel1 = findPlacePortModel1.init(CountryPortPlaceID: value["CountryPortPlaceID"].intValue, countryPortID: value["countryPortID"].intValue, PlaceName: value["PlaceName"].stringValue)
                    self.arrFindPlace.append(value["PlaceName"].stringValue)
                    self.arrFindPlaceList.append(country)

//                    let country:portPlaceListModel = portPlaceListModel.init(countryPortID: value["countryPortID"].intValue, PlaceName: value["PlaceName"].stringValue)
//                    self.arrPlace.append(value["PlaceName"].stringValue)
//                    self.arrPlaceList.append(country)

                }
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
    }
    func AddPurchaseOrderApiCalling()
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)

//        guard let sName = txtsupplierName.text,let address1 = txtAddress1.text,let address2 = txtAddress2.text,
//              let zipcode = txtZipCode.text, let contactPerson = txtcontactPerson.text,
//              let phoneNum = txtphoneNumber.text, let email = txtemailAddress.text else {
//            return
//        }

      guard let userId = UserDefaults.standard.value(forKey: "logindata") else
        {
            return
        }


        var params = [String : Any]()
        params = ["UserID":userId,"PurchaseOrderID":"0","GRIDNumber":txtGridNumber.text!,"GRIDYear":txtGridYear.text!,"SupplierID":supplierID,"SupplierContractID":txtSupplierContract.text ?? 0,"EquipmentTypeID":equipmentTypeID,"Tolerance":txtTolerance.text ?? 0,"CountryOfOriginID":strCountryLoading,"PortofLoadingID":strCountryPortLoadingId,"PortofDischargeID":PortofDischargeID,"FinalPlaceofDeliveryID":countryFindPlaceId,"PaymentTermID":paymentTermID,"DeliveryTermID":delivaryTermId,"CountryofDischargeID":strCountryDeliPortDischarge ,"EquiptmentCount":txtEquitpmentCount.text!]

        print("paramsparamsparamsparams",params)

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddPurchaseOrder, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)

//                print("responceJson",responceJson["Data"])
//                let userDefaults = UserDefaults.standard
//                let purchaseNum = responceJson["Data"]
//                userDefaults.set(purchaseNum, forKey: "IsPurchaseOrederValue")
//                userDefaults.synchronize()

                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                vc.purchaseOrderId = responceJson["Data"].intValue
               // self.navigationController?.pushViewController(vc, animated: true)
                self.present(vc, animated: true, completion: nil)
                
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}
