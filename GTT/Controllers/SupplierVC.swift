//
//  SupplierVC.swift
//  GTT
//
//  Created by ADMS on 17/02/22.
//

import UIKit
import MBProgressHUD
import DropDown

class SupplierVC: UIViewController {

    @IBOutlet weak var btnCountry:UIButton!
    @IBOutlet weak var btnState:UIButton!
    @IBOutlet weak var btnCity:UIButton!

    @IBOutlet weak var btnPlusCountry:UIButton!
    @IBOutlet weak var btnPlusState:UIButton!
    @IBOutlet weak var btnPlusCity:UIButton!

    @IBOutlet weak var btnNext:UIButton!


    @IBOutlet weak var txtsupplierName:UITextField!
    @IBOutlet weak var txtAddress1:UITextField!
    @IBOutlet weak var txtAddress2:UITextField!
    @IBOutlet weak var txtZipCode:UITextField!
    @IBOutlet weak var txtcontactPerson:UITextField!
    @IBOutlet weak var txtemailAddress:UITextField!
    @IBOutlet weak var txtphoneNumber:UITextField!



    let dropDown = DropDown()

    var strCountryId:Int? = -1
    var strStateId:Int? = -1
    var strCityId:Int? = -1

    var arrCountryList = [countryModel]()
    var arrStateList = [stateModel]()
    var arrCityList = [cityModel]()



    var arrCountry = [String]()
    var arrCity = [String]()
    var arrState = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        btnState.titleEdgeInsets.left = 10
        btnCity.titleEdgeInsets.left = 10
        btnCountry.titleEdgeInsets.left = 10


//        btnNext.layer.cornerRadius = 6.0
//        btnNext.layer.masksToBounds = true
        
        btnCountry.layer.cornerRadius = 6.0
        btnCountry.layer.masksToBounds = true

        btnCountry.layer.borderWidth = 0.5
        btnCountry.layer.borderColor = UIColor.lightGray.cgColor

        btnState.layer.cornerRadius = 6.0
        btnState.layer.masksToBounds = true

        btnState.layer.borderWidth = 0.5
        btnState.layer.borderColor = UIColor.lightGray.cgColor


        btnCity.layer.cornerRadius = 6.0
        btnCity.layer.masksToBounds = true

        btnCity.layer.borderWidth = 0.5
        btnCity.layer.borderColor = UIColor.lightGray.cgColor

        getCountryListApiCalling()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    @IBAction func btnClickBAck()
    {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func btnClickCountryList(_ sender:UIButton)
    {

        dropDown.dataSource = arrCountry//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
            self!.strCountryId = self?.arrCountryList[index].CountryID ?? 0
          sender.setTitle(item, for: .normal) //9
            self?.getStateListApiCalling()
        }
    }
    @IBAction func btnClickStateList(_ sender:UIButton)
    {
        dropDown.dataSource = arrState//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
            self!.strStateId = self?.arrStateList[index].countryStateID ?? 0
          sender.setTitle(item, for: .normal) //9
            self?.getCityListApiCalling()
        }
    }
    @IBAction func btnClickCityList(_ sender:UIButton)
    {
        dropDown.dataSource = arrCity//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
            self!.strCityId = self?.arrCityList[index].countryStateCityID ?? 0
          sender.setTitle(item, for: .normal) //9
        }
    }

    @IBAction func btnClickCountry()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        vc.delegate = self
        vc.strPopHeaderTitle = "Country"
        vc.strPopText = "Country Name"
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnClickCity()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        vc.delegate = self
        vc.strStateId  = strStateId ?? 0
        vc.strPopHeaderTitle = "City"
        vc.strPopText = "City Name"
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnClickState()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        vc.delegate = self
        vc.strCountryID  = strCountryId ?? 0
        vc.strPopHeaderTitle = "State"
        vc.strPopText = "State Name"
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnClickNext()
    {
        if validated() == true{
            AddSupplierApiCalling()
        }
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "BankInfoVC") as! BankInfoVC
//        self.navigationController?.pushViewController(vc, animated: true)
    }


    func validated() -> Bool
    {
        var valid: Bool = true
        if txtsupplierName.text == ""
        {
            self.view.makeToast("please enter supplier name")
            valid = false
        }else if txtAddress1.text == ""
        {
            self.view.makeToast("please enter address line 1")
            valid = false
        }else if txtAddress2.text == ""
        {
            self.view.makeToast("please enter address line 2")
            valid = false
        }
        else if btnCountry.titleLabel?.text == nil
        {
            self.view.makeToast("please enter country name")
            valid = false
        }
        else if btnState.titleLabel?.text == nil
        {
            self.view.makeToast("please enter state name")
            valid = false
        }
        else if btnCity.titleLabel?.text == nil
        {
            self.view.makeToast("please enter city name")
            valid = false
        }
        else if txtZipCode.text == ""
        {
            self.view.makeToast("please enter zip code")
            valid = false
        }
        else if txtcontactPerson.text == ""
        {
            self.view.makeToast("please enter contact person name")
            valid = false
        }
        else if txtemailAddress.text == ""
        {
            self.view.makeToast("please enter email")
            valid = false
        }
        else if txtphoneNumber.text == ""
        {
            self.view.makeToast("please enter phone number")
            valid = false
        }
        return valid
    }
}
extension SupplierVC:supplierDelegate{
    func passSupplierModelObject() {
        getCountryListApiCalling()
        getStateListApiCalling()
        getCityListApiCalling()
    }
}
extension SupplierVC
{
    func AddSupplierApiCalling()
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)

        guard let sName = txtsupplierName.text,let address1 = txtAddress1.text,let address2 = txtAddress2.text,
              let zipcode = txtZipCode.text, let contactPerson = txtcontactPerson.text,
              let phoneNum = txtphoneNumber.text, let email = txtemailAddress.text else {
            return
        }
        var params = [String : Any]()
        params = ["supplierName":sName,"supplierAddressLine1":address1,"supplierAddressLine2":address2,"cityID":strCityId ?? 0,"stateID":strStateId as Any,"CountryID":strCountryId ?? 0,"zipCode":zipcode,"contactPerson":contactPerson,"emailAddress":email,"phoneNumber":phoneNum]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddSupplier, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
               // self.dismiss(animated: true, completion: nil)
                self.navigationController?.popViewController(animated: true)
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }


    // get ApiCalling

    func getCountryListApiCalling()
    {
        self.arrCountry.removeAll()
        self.arrCountryList.removeAll()

//        MBProgressHUD.showAdded(to: self.view, animated: true)
//
//        guard let sName = txtsupplierName.text,let address1 = txtAddress1.text,let address2 = txtAddress2.text,
//              let zipcode = txtZipCode.text, let contactPerson = txtcontactPerson.text,
//              let phoneNum = txtphoneNumber.text, let email = txtemailAddress.text else {
//            return
//        }
//        var params = [String : Any]()
//        params = ["supplierName":sName,"supplierAddressLine1":address1,"supplierAddressLine2":address2,"cityID":strCityId,"stateID":strStateId,"CountryID":strCountryId,"zipCode":zipcode,"contactPerson":contactPerson,"emailAddress":email,"phoneNumber":phoneNum]

        ApiHttpUtility.sharedUHttp.callGetHttpUtility(urlString: API.GetCountryList) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                print(responceJson)
               // self.getStateListApiCalling()

                let arrData = responceJson["Data"].array
                for value in arrData! {

                    let country:countryModel = countryModel.init(countryName: value["CountryName"].stringValue, countryID: value["CountryID"].intValue)
                    self.arrCountry.append(value["CountryName"].stringValue)
                    self.arrCountryList.append(country)
                }
            }else
            {
//                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
//            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    func getStateListApiCalling()
    {
        self.arrState.removeAll()
        self.arrStateList.removeAll()


        var params = [String : Any]()
        params = ["countryID":strCountryId ?? 0]

        print("params",params)

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.GetCountryStateList, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
               // self.getCityListApiCalling()
                let arrData = responceJson["Data"].array
                for value in arrData! {

                    let state:stateModel = stateModel.init(stateName: value["StateName"].stringValue, cStateID: value["countryStateID"].intValue)
                    self.arrState.append(value["StateName"].stringValue)
                    self.arrStateList.append(state)
                }
            }else
            {
//                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
//            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    func getCityListApiCalling()
    {

        self.arrCity.removeAll()
        self.arrCityList.removeAll()

        var params = [String : Any]()
        params = ["countryStateID":strStateId ?? 0]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.GetCountryStateCityList, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                let arrData = responceJson["Data"].array
                for value in arrData! {

                    let city:cityModel = cityModel.init(cityName: value["CityName"].stringValue, cStateCityID: value["countryStateCityID"].intValue)
                    self.arrCity.append(value["CityName"].stringValue)
                    self.arrCityList.append(city)
                }
//                MBProgressHUD.hide(for: self.view, animated: true)
//                self.dismiss(animated: true, completion: nil)
            }else
            {
//                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
//            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}
