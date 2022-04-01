//
//  SaleOrderVC1.swift
//  GTT
//
//  Created by ADMS on 16/02/22.
//

import UIKit
import DropDown
import MBProgressHUD
import Alamofire
import Toast_Swift

class SaleOrderVC1: UIViewController {

    @IBOutlet weak var tblSales:UITableView!
    @IBOutlet weak var btnNext:UIButton!

    @IBOutlet weak var txtNumber:UITextField!
    @IBOutlet weak var txtSupplier:UITextField!

    @IBOutlet weak var btnNumber:UIButton!

    var selectedIndex:Int = 0

    var arrSupplier = [String]()
    var arrSupplierList = [supplierModel]()
    let dropDown = DropDown()
    var arrMainList = [salesPurchaseModel]()
    var arrPurchaseList = [purchaseOrderMatrialModel]()
    var arrSaleList = [saleOrderMatrialModel]()

    let arrHeaderTitle = ["Open P.O","P.O Added"]
 //   var arrPurchaseList = [purchseModel]()


    var salesOrderId:Int = 0
    var strPoNumber:String = ""
    var supplierId:Int = 0
    var purchaseOrderMaterialID:String = ""
    var salesQty:String = ""

    var supplierName:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        btnNumber.setTitle(supplierName, for: .normal)

        GetFirstCallSalesOrderMaterialApiCall()
        GetPurchaseOrderListApiCall(number: "" ?? "", SupplierID: "\(self.supplierId)")




        getSupplierList()
        tblSales.estimatedRowHeight = 50
        tblSales.rowHeight = UITableView.automaticDimension



//        let nibName = UINib(nibName: "PurchaseOderCell", bundle: nil)
//        self.tblSales.register(nibName, forCellReuseIdentifier: "PurchaseOderCell")

//        for(index,_) in arrHeaderTitle.enumerated(){
//            self.arrMainList[index].title = arrHeaderTitle[index]
//        }

        txtNumber.addTarget(self, action: #selector(self.textFieldValueChanged(_:)), for: UIControl.Event.editingChanged)

       // txtNumber.delegate = self

        print("salesOrderId",salesOrderId)

        btnNumber.layer.cornerRadius = 6.0
        btnNumber.layer.masksToBounds = true

        btnNumber.layer.borderWidth = 0.5
        btnNumber.layer.borderColor = UIColor.lightGray.cgColor



        let nibName = UINib(nibName: "PurchaseOpenCell", bundle: nil)
        self.tblSales.register(nibName, forCellReuseIdentifier: "PurchaseOpenCell")

        let nibName1 = UINib(nibName: "PurchaseHeaderCell", bundle: nil)
        self.tblSales.register(nibName1, forCellReuseIdentifier: "PurchaseHeaderCell")

        let nibName2 = UINib(nibName: "SalesPoAddedCell", bundle: nil)
        self.tblSales.register(nibName2, forCellReuseIdentifier: "SalesPoAddedCell")


//        let nibName1 = UINib(nibName: "PurchaseCell", bundle: nil)
//        self.tblPurchase.register(nibName1, forCellReuseIdentifier: "PurchaseCell")

      //  self.tblSales.register(UINib(nibName: "SalesCell", bundle: nil), forCellReuseIdentifier: "SalesCell")

        self.tblSales.sectionHeaderHeight = 0.0;
        self.tblSales.sectionFooterHeight = 0.0;


    }
    @objc func textFieldValueChanged(_ textField: UITextField)
    {
        print(textField.text ?? "")
        //call your api here
        strPoNumber = textField.text ?? ""
        GetPurchaseOrderListApiCall(number: textField.text ?? "", SupplierID: "\(self.supplierId)")
    }

}
extension SaleOrderVC1:UITableViewDelegate,UITableViewDataSource
{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0
        {
            return self.arrPurchaseList.count
        }else if section == 1{
            return self.arrSaleList.count
        }else{
            return 0
        }

      //  return self.arrMainList[section].arrSalePurchase.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseOpenCell", for: indexPath) as! PurchaseOpenCell

            if indexPath.row != 0
            {
                cell.viewHeightConstraint.constant = 0
            }else{
                cell.viewHeightConstraint.constant = 20
            }


            cell.lblMaterial.text = "\(self.arrPurchaseList[indexPath.row].MaterialName)"
            cell.lblAvialQty.text = "\(self.arrPurchaseList[indexPath.row].AvailableQunatity)"
            cell.lblContractQty.text = "\(self.arrPurchaseList[indexPath.row].ContractQuantity)"
            cell.lblSupplier.text = "\(self.arrPurchaseList[indexPath.row].SupplierName)"
            cell.lblAvg.text = "\(self.arrPurchaseList[indexPath.row].AverageLoading)"

            cell.selectionStyle = .none

            cell.btnPlus.addTarget(self, action: #selector(btnPlusClick), for: .touchUpInside)
            cell.btnPlus.tag = indexPath.row
//            cell.purchaseVw.layer.cornerRadius = 4.0
//            cell.purchaseVw.layer.masksToBounds = true
//
//            cell.purchaseVw.layer.borderWidth = 0.5
//            cell.purchaseVw.layer.borderColor = UIColor.lightGray.cgColor

            return cell

        }
        else if indexPath.section == 1
        {


            let cell = tableView.dequeueReusableCell(withIdentifier: "SalesPoAddedCell", for: indexPath) as! SalesPoAddedCell

            if indexPath.row != 0
            {
                cell.viewHeightConstraint.constant = 0
            }else{
                cell.viewHeightConstraint.constant = 20
            }


            cell.lblMaterial.text = "\(self.arrSaleList[indexPath.row].MaterialName)"
            cell.lblSupplier.text = "\(self.arrSaleList[indexPath.row].SupplierName)"
            cell.lblSaleQty.text = "\(self.arrSaleList[indexPath.row].ContractQuantity)"
            cell.lblSrNo.text = "\(indexPath.row + 1)"
            cell.lblPackaging.text = "\(self.arrSaleList[indexPath.row].PackagingTypename)"


            cell.btnDelete.addTarget(self, action: #selector(deleteRecordClick), for: .touchUpInside)
            cell.btnDelete.tag = indexPath.row



            cell.selectionStyle = .none

//            cell.purchaseVw.layer.cornerRadius = 4.0
//            cell.purchaseVw.layer.masksToBounds = true
//
//            cell.purchaseVw.layer.borderWidth = 0.5
//            cell.purchaseVw.layer.borderColor = UIColor.lightGray.cgColor

            return cell

        }

        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = tableView.dequeueReusableCell(withIdentifier: "PurchaseHeaderCell") as! PurchaseHeaderCell
        viewHeader.btnPlus.tag = section

        viewHeader.lblHeaderTitle.text = arrHeaderTitle[section]
        viewHeader.btnPlus.layer.borderWidth = 0.5
        viewHeader.btnPlus.layer.borderColor = UIColor.black.cgColor

//        viewHeader.layer.borderWidth = 0.5
//        viewHeader.layer.borderColor = UIColor.black.cgColor


        viewHeader.btnPlus.layer.cornerRadius = 6.0
        viewHeader.btnPlus.layer.masksToBounds = true
        viewHeader.lblHeaderTitle.textColor = UIColor.white

        viewHeader.backgroundColor = UIColor.systemTeal

        viewHeader.btnPlus.isHidden = true

       // viewHeader.btnPlus.addTarget(self, action: #selector(btnPlusClick), for: .touchUpInside)
        return viewHeader
    }


    @objc func btnPlusClick(sender:UIButton)
    {

        self.view.endEditing(true)

        let position: CGPoint = sender.convert(.zero, to: self.tblSales)
        let indexPath = self.tblSales.indexPathForRow(at: position)
        let cell: PurchaseOpenCell = tblSales.cellForRow(at: indexPath!)! as!
            PurchaseOpenCell
        salesQty = cell.txtSaleQty.text ?? ""

        if Int(arrPurchaseList[sender.tag].AvailableQunatity)! >= Int(salesQty)!
        {
            if cell.txtSaleQty.text?.count != 0
            {
                purchaseOrderMaterialID = "\(arrPurchaseList[sender.tag].purchaseordermaterialid)"

                cell.txtSaleQty.text = ""
                var params = [String : Any]()
                params = ["SalesOrderMaterialID":"0","SalesOrderID":salesOrderId,"MaterialID":arrPurchaseList[sender.tag].MaterialID,"ContractQuantity":salesQty ,"RatePerMT":arrPurchaseList[sender.tag].RatePerMt,"CurrencyID":arrPurchaseList[sender.tag].CurrencyID as Any,"AverageLoading":arrPurchaseList[sender.tag].AverageLoading,"PackagingID":arrPurchaseList[sender.tag].PackagingTypeID]

                print("params",params)

                AddSalesMaterialApiCall(parameters: params)

            }
            else{
                self.view.makeToast("Please enter sales qty.")
            }
        }else{
            self.view.makeToast("Please enter less value compare to available quantity.")
        }



    }
    

    @objc func deleteRecordClick(_sender:UIButton)
    {
        let alertController = UIAlertController(title: "", message: "Are you sure you want to delete sales materal order?", preferredStyle:UIAlertController.Style.alert)

        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        { action -> Void in
            self.selectedIndex = Int(self.arrSaleList[_sender.tag].SalesOrderMaterialID)
            let indexPath = IndexPath(row: _sender.tag, section: 0)
            self.arrSaleList.remove(at: Int(indexPath.row))
            self.DeletePurchaseOrderMaterialApiCall()
            //self.tblSales.reloadData()
        })
        alertController.addAction(UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.destructive)
        { action -> Void in
          return
        })
        self.present(alertController, animated: true, completion: nil)
    }
}
extension SaleOrderVC1
{
    @IBAction func btnClickNext(_sender:UIButton)
    {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "SalesOrderListVC") as! SalesOrderListVC
//        self.navigationController?.pushViewController(vc, animated: true)

        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: SalesOrderListVC.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }

    }

    @IBAction func btnClickBack()
    {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func btnClickSupplier(_ sender:UIButton)
    {
        dropDown.dataSource = arrSupplier//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
            //self!.supplierID = self?.arrSupplierList[index].SupplierID ?? 0
         //   self?.arrSaleList.removeAll()
            self?.btnNumber.setTitle(self?.arrSupplierList[index].SupplierName ?? "", for: .normal)
          //  self?.txtSupplier.text = self?.arrSupplierList[index].SupplierName ?? ""
            self!.supplierId = self!.arrSupplierList[index].SupplierID
            self?.GetPurchaseOrderListApiCall(number: "", SupplierID: "\(self!.arrSupplierList[index].SupplierID)")

          sender.setTitle(item, for: .normal) //9
           // self?.getStateListApiCalling()
        }

    }
}
extension SaleOrderVC1{
    func getSupplierList()
    {
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
            }
        }
    }

    func GetPurchaseOrderListApiCall(number:String,SupplierID:String)
    {
        self.arrPurchaseList.removeAll()

        MBProgressHUD.showAdded(to: self.view, animated: true)
        var params = [String : Any]()
        params = ["GIRDNumberYear":number,"SupplierID":SupplierID]

        ApiHttpUtility.sharedUHttp.callPostMultipleApiHttpUtility(urlString: API.GetPOMaterialList, params: params) { (responceJson, error) in
            if(responceJson?[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)

                if let error = error {
                    print(error.localizedDescription)
                    return
                }

                print(responceJson)
               // self.getStateListApiCalling()



                let arrData = responceJson?["Data"].array ?? []
                for (index,value) in arrData.enumerated() {

                    let purchaseOrderMatrialModel1:purchaseOrderMatrialModel = purchaseOrderMatrialModel.init(purchaseordermaterialid: value["purchaseordermaterialid"].intValue, ContractQuantity: value["ContractQuantity"].stringValue, RatePerMt: value["RatePerMt"].stringValue, AverageLoading: value["AverageLoading"].stringValue, CurrencyAbbr: value["CurrencyAbbr"].stringValue, PackagingTypename: value["PackagingTypename"].stringValue, MaterialName: value["MaterialName"].stringValue,MaterialID: value["MaterialID"].intValue,CurrencyID: value["CurrencyID"].intValue,PackagingTypeID: value["PackagingTypeID"].intValue,SupplierName: value["SupplierName"].stringValue,AvailableQunatity: value["AvailableQunatity"].stringValue,CurrencyNamme: value["CurrencyName"].stringValue, PODate: value["PODate"].stringValue, QtyReceivedInShipment: value["QtyReceivedInShipment"].stringValue, SupplierShipmentPurchaseorderMaterialID: value["SupplierShipmentPurchaseorderMaterialID"].stringValue)
                    self.arrPurchaseList.append(purchaseOrderMatrialModel1)
                  //  self.arrPurchaseList = self.arrpurchaseOrderMatrialList
                }

                //self.arrSalesPurchase

                DispatchQueue.main.async {
                    self.tblSales.reloadData()
                }

            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
    }
    func DeletePurchaseOrderMaterialApiCall()
    {

        var params = [String : Any]()
        params = ["SalesOrderMaterialID":selectedIndex]

        print("params",params)

        MBProgressHUD.showAdded(to: self.view, animated: true)

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.DeleteSalesOrderMaterial, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
               // self.getCityListApiCalling()
               // let arrData = responceJson["Data"].array
//                for value in arrData! {
//
//                    let purchaseOrderMatrialModel1:purchaseOrderMatrialModel = purchaseOrderMatrialModel.init(purchaseordermaterialid: value["purchaseordermaterialid"].intValue, ContractQuantity: value["ContractQuantity"].stringValue, RatePerMT: value["RatePerMT"].stringValue, AverageLoading: value["AverageLoading"].stringValue, CurrencyAbbr: value["CurrencyAbbr"].stringValue, PackagingTypename: value["PackagingTypename"].stringValue, MaterialName: value["MaterialName"].stringValue)
//                    self.arrpurchaseOrderMatrialList.append(purchaseOrderMatrialModel1)
//                }

//                DispatchQueue.main.async {
//                    self.tblSales.reloadData()
//                }

                self.GetPurchaseOrderListApiCall(number: "", SupplierID: "\(self.supplierId)")

            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    func AddSalesMaterialApiCall(parameters :[String : Any])
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)

        //        guard let sName = txtsupplierName.text,let address1 = txtAddress1.text,let address2 = txtAddress2.text,
        //              let zipcode = txtZipCode.text, let contactPerson = txtcontactPerson.text,
        //              let phoneNum = txtphoneNumber.text, let email = txtemailAddress.text else {
        //            return
        //        }
      //  var params = [String : Any]()
     //   params = parameters
//        params = ["SalesOrderMaterialID":"0","SalesOrderID":purchaseOrderId,"MaterialID":materialId,"ContractQuantity":txtQty.text ?? 0,"RatePerMT":txtRate.text ?? 0,"CurrencyID":currancyId as Any,"AverageLoading":txtAvgLoading.text ?? 0,"PackagingID":packagingId]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddSalesOrderMaterial, params: parameters) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.POSOMaterial(SalesOrderMaterialID: "\(responceJson["Data"].intValue)")
               // self.delegate?.passPuchaseObject()
               // self.dismiss(animated: true, completion: nil)
                //self.navigationController?.popViewController(animated: true)
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }

    func POSOMaterial(SalesOrderMaterialID:String)
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)

        //        guard let sName = txtsupplierName.text,let address1 = txtAddress1.text,let address2 = txtAddress2.text,
        //              let zipcode = txtZipCode.text, let contactPerson = txtcontactPerson.text,
        //              let phoneNum = txtphoneNumber.text, let email = txtemailAddress.text else {
        //            return
        //        }
        var params = [String : Any]()
        params = ["PurchaseOrderMaterialID":purchaseOrderMaterialID,"SalesOrderMaterialID":SalesOrderMaterialID,"ContractQuantity":salesQty]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.POSOMaterial, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.purchaseOrderMaterialID = ""
                self.salesQty = ""
                self.GetSalesOrderMaterialApiCall()
               // self.delegate?.passPuchaseObject()
               // self.dismiss(animated: true, completion: nil)
                //self.navigationController?.popViewController(animated: true)
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }

    func GetFirstCallSalesOrderMaterialApiCall()
    {
        self.arrSaleList.removeAll()
        var params = [String : Any]()
        params = ["SalesOrderID":salesOrderId]

        print("params",params)

        MBProgressHUD.showAdded(to: self.view, animated: true)

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.GetSalesOrderMaterial, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
               // self.getCityListApiCalling()
                let arrData = responceJson["Data"].array
                for value in arrData! {

                    let purchaseOrderMatrialModel1:saleOrderMatrialModel = saleOrderMatrialModel.init(SalesOrderMaterialID: value["SalesOrderMaterialID"].intValue, ContractQuantity: value["ContractQuantity"].stringValue, RatePerMT: value["RatePerMT"].stringValue, AverageLoading: value["AverageLoading"].stringValue, CurrencyAbbr: value["CurrencyAbbr"].stringValue, PackagingTypename: value["PackagingTypename"].stringValue, MaterialName: value["MaterialName"].stringValue,MaterialID: value["MaterialID"].intValue,CurrencyID: value["CurrencyID"].intValue,PackagingTypeID: value["PackagingTypeID"].intValue,SalesOrderID: value["SalesOrderID"].intValue,SupplierName: value["SupplierName"].stringValue,CurrencyName: value["CurrencyName"].stringValue)
                    self.arrSaleList.append(purchaseOrderMatrialModel1)
                }

                self.GetPurchaseOrderListApiCall(number: self.strPoNumber, SupplierID: "\(self.supplierId)")
                DispatchQueue.main.async {
                    self.tblSales.reloadData()
                }

            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }

    func GetSalesOrderMaterialApiCall()
    {
        self.arrSaleList.removeAll()
        var params = [String : Any]()
        params = ["SalesOrderID":salesOrderId]

        print("params",params)

        MBProgressHUD.showAdded(to: self.view, animated: true)

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.GetSalesOrderMaterial, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
               // self.getCityListApiCalling()
                let arrData = responceJson["Data"].array
                for value in arrData! {

                    let purchaseOrderMatrialModel1:saleOrderMatrialModel = saleOrderMatrialModel.init(SalesOrderMaterialID: value["SalesOrderMaterialID"].intValue, ContractQuantity: value["ContractQuantity"].stringValue, RatePerMT: value["RatePerMT"].stringValue, AverageLoading: value["AverageLoading"].stringValue, CurrencyAbbr: value["CurrencyAbbr"].stringValue, PackagingTypename: value["PackagingTypename"].stringValue, MaterialName: value["MaterialName"].stringValue,MaterialID: value["MaterialID"].intValue,CurrencyID: value["CurrencyID"].intValue,PackagingTypeID: value["PackagingTypeID"].intValue,SalesOrderID: value["SalesOrderID"].intValue,SupplierName: value["SupplierName"].stringValue,CurrencyName: value["CurrencyName"].stringValue)
                    self.arrSaleList.append(purchaseOrderMatrialModel1)
                }

                self.GetPurchaseOrderListApiCall(number: self.strPoNumber, SupplierID: "\(self.supplierId)")
//                DispatchQueue.main.async {
//                    self.tblSales.reloadData()
//                }

            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}
extension SaleOrderVC1:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        print("dsfdsfdsfdsf",string)
        var str = textField.text ?? ""
        print("str",str)

      //  GetPurchaseOrderListApiCall(number: textField.text ?? "")
        return true
    }
}
