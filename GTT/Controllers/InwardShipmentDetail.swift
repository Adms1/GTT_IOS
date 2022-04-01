//
//  InwardShipmentDetail.swift
//  GTT
//
//  Created by ADMS on 16/03/22.
//

import UIKit
import MBProgressHUD
import Alamofire
import Toast_Swift
import DropDown

class InwardShipmentDetail: UIViewController {

    @IBOutlet weak var btnShipmentLine:UIButton!
    @IBOutlet weak var btnPlaceReceipt:UIButton!
    @IBOutlet weak var btnPortLoading:UIButton!
    @IBOutlet weak var btnPortDelivary:UIButton!
    @IBOutlet weak var btnFindPlace:UIButton!

    @IBOutlet weak var btnNext:UIButton!


    @IBOutlet weak var btnSupplier:UIButton!
    @IBOutlet weak var btnCountryLoading:UIButton!
    @IBOutlet weak var btnCountryDelivary:UIButton!


    @IBOutlet weak var txtBillnumber:UITextField!
    @IBOutlet weak var btnBillDate:UITextField!
    @IBOutlet weak var txtVesselName:UITextField!

    let dropDown = DropDown()
    var SupplierShipmentID:Int = 0
    var strShipmentLineId:Int = 0
    var strCountryLoading:Int = 0
    var strCountryDeliPortDischarge:Int = 0
    var PortofDischargeID:Int = 0
    var countryFindPlaceId:Int = 0
    var strCountryDelivary:Int = 0
    var strCountryPortLoadingId:Int = 0
    var supplierID:Int = -1
    var arrSupplier = [String]()

    var arrshipLineList = [shipLineModel]()
    var arrshipLine = [String]()



    var arrSupplierList = [supplierModel]()

    var arrCountryList = [countryModel]()
    var arrCountry = [String]()

    var arrPortList = [findPlacePortModel]()
    var arrPort = [String]()

    var arrDisPortList = [findPlacePortModel]()
    var arrDisPort = [String]()


    var arrFindPlaceList = [findPlacePortModel1]()
    var arrFindPlace = [String]()

    var arrDelivaryTermList = [delivaryTermModel]()
    var arrDelivaryTerm = [String]()

    var arrPaymentTermList = [paymentTermModel]()
    var arrPaymentTerm = [String]()


    var strUpdateDetailVC:String = ""

    var obj:ShipmentListModel?



    override func viewDidLoad() {
        super.viewDidLoad()


        if strUpdateDetailVC == "Edit"
        {

            btnSupplier.setTitle(obj?.suppliername ?? "", for: .normal)

            guard let sId = obj?.supplierid else {
                return
            }


            supplierID =  Int(sId) ?? 0


            txtBillnumber.text = obj?.blno ?? ""
            btnBillDate.text = obj?.bldate ?? ""

            btnShipmentLine.setTitle(obj?.shippinglinename ?? "", for: .normal)

            guard let shippinglineid = obj?.shippinglineid else {
                return
            }
            strShipmentLineId =  Int(shippinglineid) ?? 0

            txtVesselName.text = obj?.vesselName ?? ""

            btnCountryLoading.setTitle(obj?.countryofloading ?? "", for: .normal)

            guard let countryofloadingid = obj?.countryofloadingid else {
                return
            }

            strCountryLoading =  Int(countryofloadingid) ?? 0

            btnCountryDelivary.setTitle(obj?.countryofdelivery ?? "", for: .normal)

            guard let countryofdeliveryid = obj?.countryofdeliveryid else {
                return
            }

            strCountryDeliPortDischarge =  Int(countryofdeliveryid) ?? 0

            btnPortLoading.setTitle(obj?.portofloading ?? "", for: .normal)

            guard let portofloading = obj?.portofloadingid else {
                return
            }

            strCountryPortLoadingId =  Int(portofloading) ?? 0

            btnPortDelivary.setTitle(obj?.portofdischarge ?? "", for: .normal)

            guard let portofdischargeid = obj?.portofdischargeid else {
                return
            }
            PortofDischargeID =  Int(portofdischargeid) ?? 0

            btnFindPlace.setTitle(obj?.finalplaceOfdelivery ?? "", for: .normal)

            guard let finalplaceofdeliveryid = obj?.finalplaceofdeliveryid else {
                return
            }
            countryFindPlaceId =  Int(finalplaceofdeliveryid) ?? 0

            btnPlaceReceipt.setTitle(obj?.originplaceofreceipt ?? "", for: .normal)


            countryFindPlaceId =  Int(finalplaceofdeliveryid) ?? 0



            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "dd/MM/yyyy"
            let showDate = inputFormatter.date(from: obj?.bldate ?? "")
            inputFormatter.dateFormat = "yyyy/MM/dd"
            let resultString = inputFormatter.string(from: showDate!)



            self.btnBillDate.text = "\(resultString)"



            btnNext.setTitle("Update", for: .normal)
        }else{
            btnNext.setTitle("Submit", for: .normal)
        }


        btnSupplier.titleEdgeInsets.left = 10
        btnCountryLoading.titleEdgeInsets.left = 10
        btnCountryDelivary.titleEdgeInsets.left = 10
        btnPortLoading.titleEdgeInsets.left = 10

        btnCountryDelivary.titleEdgeInsets.left = 10
        btnFindPlace.titleEdgeInsets.left = 10
        btnPlaceReceipt.titleEdgeInsets.left = 10
        btnShipmentLine.titleEdgeInsets.left = 10
        btnPortDelivary.titleEdgeInsets.left = 10


        btnCountryLoading.layer.cornerRadius = 6.0
        btnCountryLoading.layer.masksToBounds = true

        btnCountryLoading.layer.borderWidth = 0.5
        btnCountryLoading.layer.borderColor = UIColor.black.cgColor

        btnCountryDelivary.layer.cornerRadius = 6.0
        btnCountryDelivary.layer.masksToBounds = true

        btnCountryDelivary.layer.borderWidth = 0.5
        btnCountryDelivary.layer.borderColor = UIColor.black.cgColor


        btnSupplier.layer.cornerRadius = 6.0
        btnSupplier.layer.masksToBounds = true

        btnSupplier.layer.borderWidth = 0.5
        btnSupplier.layer.borderColor = UIColor.black.cgColor


        txtBillnumber.layer.cornerRadius = 6.0
        txtBillnumber.layer.masksToBounds = true

        txtBillnumber.layer.borderWidth = 0.5
        txtBillnumber.layer.borderColor = UIColor.black.cgColor

        btnBillDate.layer.cornerRadius = 6.0
        btnBillDate.layer.masksToBounds = true

        btnBillDate.layer.borderWidth = 0.5
        btnBillDate.layer.borderColor = UIColor.black.cgColor

        txtVesselName.layer.cornerRadius = 6.0
        txtVesselName.layer.masksToBounds = true

        txtVesselName.layer.borderWidth = 0.5
        txtVesselName.layer.borderColor = UIColor.black.cgColor



        btnShipmentLine.layer.cornerRadius = 6.0
        btnShipmentLine.layer.masksToBounds = true

        btnShipmentLine.layer.borderWidth = 0.5
        btnShipmentLine.layer.borderColor = UIColor.black.cgColor


        btnPlaceReceipt.layer.cornerRadius = 6.0
        btnPlaceReceipt.layer.masksToBounds = true

        btnPlaceReceipt.layer.borderWidth = 0.5
        btnPlaceReceipt.layer.borderColor = UIColor.black.cgColor


        btnPortLoading.layer.cornerRadius = 6.0
        btnPortLoading.layer.masksToBounds = true

        btnPortLoading.layer.borderWidth = 0.5
        btnPortLoading.layer.borderColor = UIColor.black.cgColor

        btnPortDelivary.layer.cornerRadius = 6.0
        btnPortDelivary.layer.masksToBounds = true

        btnPortDelivary.layer.borderWidth = 0.5
        btnPortDelivary.layer.borderColor = UIColor.black.cgColor

        btnFindPlace.layer.cornerRadius = 6.0
        btnFindPlace.layer.masksToBounds = true

        btnFindPlace.layer.borderWidth = 0.5
        btnFindPlace.layer.borderColor = UIColor.black.cgColor

    }
    override func viewWillAppear(_ animated: Bool) {
        callMultipleApiCAlling()
//        GetEquipmentListApiCalling()
//        getCountryListApiCalling()
//        GetSupplierListApiCalling()
    }
    @IBAction func btnClickSubmit()
    {
        if validated() == true
        {
            AddInwardShipmentApiCalling()
        }
    }
    @IBAction func btnClickBack()
    {
        self.navigationController?.popViewController(animated: true)
    }


    func validated() -> Bool
    {
        var valid: Bool = true
        if btnSupplier.titleLabel?.text == nil
        {
            self.view.makeToast("please select supplier name")
            valid = false
        }
        else if btnShipmentLine.titleLabel?.text == nil
        {
            self.view.makeToast("please select shipment line")
            valid = false
        }
        else if txtVesselName.text == ""
        {
            self.view.makeToast("please enter vessel name")
            valid = false
        }
        else if btnCountryLoading.titleLabel?.text == nil
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
        else if btnPortDelivary.titleLabel?.text == nil
        {
            self.view.makeToast("please enter port of delivary")
            valid = false
        }
        else if btnFindPlace.titleLabel?.text == nil
        {
            self.view.makeToast("please enter place of delivary")
            valid = false
        }
//        else if btnPlaceReceipt.titleLabel?.text == nil
//        {
//            self.view.makeToast("please enter payment terms")
//            valid = false
//        }

        return valid
    }

    @IBAction func btnSupplierClick(_ sender: UIButton)
    {
        dropDown.dataSource = arrSupplier//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
        self!.supplierID = self?.arrSupplierList[index].SupplierID ?? 0
          sender.setTitle(item, for: .normal) //9
        }
    }

    @IBAction func btnClickShipmentLineList(_ sender:UIButton)
    {
        dropDown.dataSource = arrshipLine//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
            self!.strShipmentLineId = self?.arrshipLineList[index].Shippinglineid ?? 0
          sender.setTitle(item, for: .normal) //9
        }
    }

    @IBAction func btnClickAddShipmentLine()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        vc.strPopHeaderTitle = "Add Shipment Line"
        vc.strPopText = "Shipment Line"
     //   vc.strCountryID = strCountryLoading
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
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

    @IBAction func btnClickCountyLoading()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        vc.strPopHeaderTitle = "Country of Loading"
        vc.strPopText = "Country Name"
      //  vc.strCountryID = strCountryLoading
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }


    @IBAction func btnClickCountryPortLoading()
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

    @IBAction func btnClickCountryDelivary()
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

    @IBAction func btnClickCountryPortDischange()
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

    @IBAction func btnClickCountryPortDischargeList(_ sender:UIButton)
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

    @IBAction func btnClickCountryFindPlaceDeelivary(_ sender:UIButton)
    {
        dropDown.dataSource = arrFindPlace//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
            self!.countryFindPlaceId = self?.arrFindPlaceList[index].CountryPortPlaceID ?? 0
            self!.btnPlaceReceipt.setTitle(self?.arrFindPlaceList[index].PlaceName ?? "", for: .normal)
          sender.setTitle(item, for: .normal) //9
        }
    }

}
extension InwardShipmentDetail
{
    func callMultipleApiCAlling()
    {
        self.arrCountry.removeAll()
        self.arrCountryList.removeAll()

        self.arrSupplierList.removeAll()
        self.arrSupplier.removeAll()


        self.arrshipLine.removeAll()
        self.arrshipLineList.removeAll()

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
        print("GetShippingLineList")


        ApiHttpUtility.sharedUHttp.callGetMultipleApiHttpUtility(urlString: API.GetShippingLineList) { (responceJson, error) in
            if(responceJson?[Constants.Status] == "Success")
            {
               // MBProgressHUD.hide(for: self.view, animated: true)

               // self.getCityListApiCalling()
                let arrData = responceJson?["Data"].array
                for value in arrData! {

                    let state:shipLineModel = shipLineModel.init(Shippinglinename: value["Shippinglinename"].stringValue, Shippinglineid: value["Shippinglineid"].intValue)
                    self.arrshipLine.append(value["Shippinglinename"].stringValue)
                    self.arrshipLineList.append(state)
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

        if strUpdateDetailVC == "Edit"
        {

        }else
        {
            dispetchGroup.enter()
            print("GetShipmentBLNumberBLDate")



            ApiHttpUtility.sharedUHttp.callGetMultipleApiHttpUtility(urlString: API.GetShipmentBLNumberBLDate) { (responceJson, error) in
                if(responceJson?[Constants.Status] == "Success")
                {
                    print(responceJson)
                    let arrData = responceJson?["Data"].array
                    for value in arrData!

                    {
                        self.txtBillnumber.text = "\(value["Blnumber"].stringValue)"

                        let inputFormatter = DateFormatter()
                        inputFormatter.dateFormat = "dd/MM/yyyy"
                        let showDate = inputFormatter.date(from: value["Bldate"].stringValue)
                        inputFormatter.dateFormat = "yyyy/MM/dd"
                        let resultString = inputFormatter.string(from: showDate!)



                        self.btnBillDate.text = "\(resultString)"
                    }
                    dispetchGroup.leave()
                }else
                {
    //                MBProgressHUD.hide(for: self.view, animated: true)
                }
            }
        }




//        dispetchGroup.enter()
//        print("GetPaymentTermList")
//
//        ApiHttpUtility.sharedUHttp.callGetMultipleApiHttpUtility(urlString: API.GetPaymentTermList) { (responceJson, error) in
//            if(responceJson?[Constants.Status] == "Success")
//            {
//                print(responceJson)
//                let arrData = responceJson?["Data"].array
//                for value in arrData! {
//
//                    let country:paymentTermModel = paymentTermModel.init(paymentTermID: value["PaymentTermID"].intValue, paymentTermName: value["PaymentTermName"].stringValue)
//                    self.arrPaymentTerm.append(value["PaymentTermName"].stringValue)
//                    self.arrPaymentTermList.append(country)
//                }
//
//                dispetchGroup.leave()
//            }else
//            {
////                MBProgressHUD.hide(for: self.view, animated: true)
//            }
//        }

//        dispetchGroup.enter()
//        print("GetDeliveryTermList")
//
//        ApiHttpUtility.sharedUHttp.callGetMultipleApiHttpUtility(urlString: API.GetDeliveryTermList) { (responceJson, error) in
//            if(responceJson?[Constants.Status] == "Success")
//            {
//                print(responceJson)
//                let arrData = responceJson?["Data"].array
//                for value in arrData! {
//
//                    let country:delivaryTermModel = delivaryTermModel.init(deliveryTermID: value["DeliveryTermID"].intValue, deliveryName: value["DeliveryName"].stringValue)
//                    self.arrDelivaryTerm.append(value["DeliveryName"].stringValue)
//                    self.arrDelivaryTermList.append(country)
//                }
//
//                dispetchGroup.leave()
//            }else
//            {
////                MBProgressHUD.hide(for: self.view, animated: true)
//            }
//        }


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

    func AddInwardShipmentApiCalling()
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)
      guard let userId = UserDefaults.standard.value(forKey: "logindata") else
        {
            return
        }

        var params = [String : Any]()

        if strUpdateDetailVC == "Edit"
        {
            params = [
                "SupplierID":"\(supplierID)","ShipmentDate":btnBillDate.text ?? "","IsActive":"true","BLNumber":txtBillnumber.text ?? "","BLDate":btnBillDate.text ?? "","ShippingLineID":"\(strShipmentLineId)","VesselName":txtVesselName.text ?? 0,"OriginalPlaceOfLoadingID":"\(countryFindPlaceId)","PortOfLoadingID":"\(strCountryPortLoadingId)","CountryOfLoadingID":"\(strCountryLoading)","CountryOfDeliveryID":"\(strCountryDeliPortDischarge)","PortOfDischargeID":"\(PortofDischargeID)","FinalPlaceOfDeliveryID":"\(countryFindPlaceId)","SupplierShipmentID":"\(obj?.suppliershipmentid ?? "")"]
        }else{
            params = [
                "SupplierID":"\(supplierID)","ShipmentDate":btnBillDate.text ?? "","IsActive":"true","BLNumber":txtBillnumber.text ?? "","BLDate":btnBillDate.text ?? "","ShippingLineID":"\(strShipmentLineId)","VesselName":txtVesselName.text ?? 0,"OriginalPlaceOfLoadingID":"\(countryFindPlaceId)","PortOfLoadingID":"\(strCountryPortLoadingId)","CountryOfLoadingID":"\(strCountryLoading)","CountryOfDeliveryID":"\(strCountryDeliPortDischarge)","PortOfDischargeID":"\(PortofDischargeID)","FinalPlaceOfDeliveryID":"\(countryFindPlaceId)","SupplierShipmentID":"0"]
        }



        print("paramsparamsparamsparams",params)

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddSupplierShipment, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "InwardShipmentVC") as! InwardShipmentVC
                vc.SupplierShipmentID = responceJson["Data"].intValue
                if self.strUpdateDetailVC == "Edit"
                {
                    vc.strUpdateDetailVC = "Update"
                }else{
                    vc.strUpdateDetailVC = "Submit"
                }
                vc.supplierId = self.supplierID
                self.navigationController?.pushViewController(vc, animated: true)
               // self.present(vc, animated: true, completion: nil)

            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}
extension InwardShipmentDetail:supplierDelegate
{
    func passSupplierModelObject() {
        callMultipleApiCAlling()
        GetCountryPortListApiCalling()
        GetCountryDisChargePortListApiCalling()
        GetCountryFindPlaceApiCalling()
    }
}
