

import UIKit
import DropDown
import MBProgressHUD
import Alamofire
import Toast_Swift
import SwiftyJSON

class InwardShipmentVC: UIViewController {

    @IBOutlet weak var tblSales:UITableView!
    @IBOutlet weak var btnNext:UIButton!

    //    @IBOutlet weak var txtNumber:UITextField!
    //    @IBOutlet weak var txtSupplier:UITextField!
    //
    // @IBOutlet weak var btnNumber:UIButton!


    var arrSupplier = [String]()
    var arrSupplierList = [supplierModel]()
    let dropDown = DropDown()
    var arrMainList = [salesPurchaseModel]()
    var arrPurchaseList = [purchaseOrderMatrialModel]()
    var arrSaleList = [saleOrderMatrialModel]()
    var arrsupplierShipmentList = [supplierShipmentModel]()


    var strUpdateDetailVC:String = ""


    let arrHeaderTitle = ["Open P.O","Packing Details"]
    //   var arrPurchaseList = [purchseModel]()


    var SupplierShipmentID:Int = 0

    var salesOrderId:Int = 0
    var strPoNumber:String = ""
    var supplierId:Int = -1
    var purchaseOrderMaterialID:String = ""
    var salesQty:String = ""
    var totalQtyReceive:Int = 0

    var arrResponce = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // getSupplierList()
        tblSales.estimatedRowHeight = 90
        tblSales.rowHeight = UITableView.automaticDimension



        //        let nibName = UINib(nibName: "PurchaseOderCell", bundle: nil)
        //        self.tblSales.register(nibName, forCellReuseIdentifier: "PurchaseOderCell")

        //        for(index,_) in arrHeaderTitle.enumerated(){
        //            self.arrMainList[index].title = arrHeaderTitle[index]
        //        }

        //        txtNumber.addTarget(self, action: #selector(self.textFieldValueChanged(_:)), for: UIControl.Event.editingChanged)
        //
        //       // txtNumber.delegate = self
        //
        //        print("salesOrderId",salesOrderId)
        //
        //        btnNumber.layer.cornerRadius = 6.0
        //        btnNumber.layer.masksToBounds = true
        //
        //        btnNumber.layer.borderWidth = 0.5
        //        btnNumber.layer.borderColor = UIColor.lightGray.cgColor



        let nibName = UINib(nibName: "InwardShipmentOpenPoCell", bundle: nil)
        self.tblSales.register(nibName, forCellReuseIdentifier: "InwardShipmentOpenPoCell")

        let nibName1 = UINib(nibName: "PurchaseHeaderCell", bundle: nil)
        self.tblSales.register(nibName1, forCellReuseIdentifier: "PurchaseHeaderCell")

        let nibName2 = UINib(nibName: "InwardPackingDetailCell", bundle: nil)
        self.tblSales.register(nibName2, forCellReuseIdentifier: "InwardPackingDetailCell")


        //        let nibName1 = UINib(nibName: "PurchaseCell", bundle: nil)
        //        self.tblPurchase.register(nibName1, forCellReuseIdentifier: "PurchaseCell")

        //  self.tblSales.register(UINib(nibName: "SalesCell", bundle: nil), forCellReuseIdentifier: "SalesCell")

        self.tblSales.sectionHeaderHeight = 0.0;
        self.tblSales.sectionFooterHeight = 0.0;


        GetPurchaseOrderListApiCall(number: "", SupplierID: "\(supplierId)")
    }
    //    @objc func textFieldValueChanged(_ textField: UITextField)
    //    {
    //        print(textField.text ?? "")
    //        //call your api here
    //        strPoNumber = textField.text ?? ""
    //        GetPurchaseOrderListApiCall(number: textField.text ?? "", SupplierID: self.supplierId)
    //    }

}
extension InwardShipmentVC:UITableViewDelegate,UITableViewDataSource
{

    func numberOfSections(in tableView: UITableView) -> Int {

        return 2
//        if arrPurchaseList.count != 0
//        {
//            return 2
//        }else{
//            return 0
//        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0
        {
            return self.arrPurchaseList.count
        }else if section == 1{
            return self.arrsupplierShipmentList.count
        }else{
            return 0
        }

        //  return self.arrMainList[section].arrSalePurchase.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InwardShipmentOpenPoCell", for: indexPath) as! InwardShipmentOpenPoCell


            cell.vwOpenPO.layer.borderColor = UIColor.black.cgColor
            cell.vwOpenPO.layer.borderWidth = 0.5

            cell.lblPoNo.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblPoNo.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblDate.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblDate.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblQtyOrder.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblQtyOrder.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblQtyRecive.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblQtyRecive.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblQtyReciveShipment.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblQtyReciveShipment.addBorder(.right, color: .black, thickness: 0.5)


            cell.lblPoNoValue.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblPoNoValue.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblDateValue.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblDateValue.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblQtyOrderValue.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblQtyOrderValue.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblQtyReciveValue.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblQtyReciveValue.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblQtyReciveShipmentValue.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblQtyReciveShipmentValue.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblNo1.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblNo1.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblNo2.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblNo2.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblNo3.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblNo3.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblTotal.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblTotal.addBorder(.right, color: .black, thickness: 0.5)

            cell.vwSave.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.vwSave.addBorder(.right, color: .black, thickness: 0.5)

           //

            if indexPath.row != 0
            {
                cell.vwHeaderHeightConstraint.constant = 0
                cell.lblPoNoValue.text = "\(indexPath.row + 1)"
                cell.lblDateValue.text = arrPurchaseList[indexPath.row].PODate
                cell.lblQtyOrderValue.text = arrPurchaseList[indexPath.row].ContractQuantity
                cell.lblQtyReciveValue.text = arrPurchaseList[indexPath.row].AvailableQunatity
                cell.txtQtyReciveShipmentValue.text = arrPurchaseList[indexPath.row].QtyReceivedInShipment
            }else{
                cell.vwHeaderHeightConstraint.constant = 30

                cell.lblPoNoValue.text = "\(indexPath.row + 1)"
                cell.lblDateValue.text = arrPurchaseList[indexPath.row].PODate
                cell.lblQtyOrderValue.text = arrPurchaseList[indexPath.row].ContractQuantity
                cell.lblQtyReciveValue.text = arrPurchaseList[indexPath.row].AvailableQunatity
                cell.txtQtyReciveShipmentValue.text = arrPurchaseList[indexPath.row].QtyReceivedInShipment

            }

            if indexPath.row != arrPurchaseList.count - 1
            {
                cell.btnSave.isHidden = true
                cell.vwFooterHeightConstraint.constant = 0
            }else{
                cell.btnSave.isHidden = false
                cell.vwFooterHeightConstraint.constant = 30
                cell.lblTotal.text = "Total : \(totalQtyReceive)"
                //                cell.lblQtyReciveValue.text = arrPurchaseList[indexPath.row].AvailableQunatity

            }

            cell.btnSave.addTarget(self, action: #selector(btnSaveClick), for: .touchUpInside)

            //cell.lblQtyReciveShipmentValue.text = arrPurchaseList[indexPath.row].AvailableQunatity


            //            cell.lblMaterial.text = "\(self.arrPurchaseList[indexPath.row].MaterialName)"
            //            cell.lblAvialQty.text = "\(self.arrPurchaseList[indexPath.row].AvailableQunatity)"
            //            cell.lblContractQty.text = "\(self.arrPurchaseList[indexPath.row].ContractQuantity)"
            //            cell.lblSupplier.text = "\(self.arrPurchaseList[indexPath.row].SupplierName)"
            //            cell.lblAvg.text = "\(self.arrPurchaseList[indexPath.row].AverageLoading)"

            cell.selectionStyle = .none

            //            cell.btnPlus.addTarget(self, action: #selector(btnPlusClick), for: .touchUpInside)
            //            cell.btnPlus.tag = indexPath.row
            //            cell.purchaseVw.layer.cornerRadius = 4.0
            //            cell.purchaseVw.layer.masksToBounds = true
            //
            //            cell.purchaseVw.layer.borderWidth = 0.5
            //            cell.purchaseVw.layer.borderColor = UIColor.lightGray.cgColor

            return cell

        }
        else if indexPath.section == 1
        {


            let cell = tableView.dequeueReusableCell(withIdentifier: "InwardPackingDetailCell", for: indexPath) as! InwardPackingDetailCell

            if indexPath.row != 0
            {
                cell.vwHeaderHeightConstraint.constant = 0
            }else{
                cell.vwHeaderHeightConstraint.constant = 30
            }

//            if indexPath.row != 4
//            {
//                cell.btnSave.isHidden = true
//                cell.vwFooterHeightConstraint.constant = 0
//            }else{
//                cell.btnSave.isHidden = false
//                cell.vwFooterHeightConstraint.constant = 30
//            }





            if indexPath.row != 0
            {
                cell.vwHeaderHeightConstraint.constant = 0
                cell.lblContainerValue.text = arrsupplierShipmentList[indexPath.row].ContainerNumber
                cell.lblSealValue.text = arrsupplierShipmentList[indexPath.row].SealNumber
                cell.lblGrossWTValue.text = arrsupplierShipmentList[indexPath.row].GrossWeight
                cell.lblNetWTValue.text = arrsupplierShipmentList[indexPath.row].NetWeight
            }else{
                cell.vwHeaderHeightConstraint.constant = 30

                cell.lblContainerValue.text = arrsupplierShipmentList[indexPath.row].ContainerNumber
                cell.lblSealValue.text = arrsupplierShipmentList[indexPath.row].SealNumber
                cell.lblGrossWTValue.text = arrsupplierShipmentList[indexPath.row].GrossWeight
                cell.lblNetWTValue.text = arrsupplierShipmentList[indexPath.row].NetWeight

            }

            cell.btnSave.isHidden = true
            cell.vwFooterHeightConstraint.constant = 0

//            if indexPath.row != arrPurchaseList.count - 1
//            {
//
//            }else{
//                cell.btnSave.isHidden = false
//                cell.vwFooterHeightConstraint.constant = 30
//                cell.lblTotal.text = "Total : \(totalQtyReceive)"
//                //                cell.lblQtyReciveValue.text = arrPurchaseList[indexPath.row].AvailableQunatity
//
//            }



            cell.vwOpenPO.layer.borderColor = UIColor.black.cgColor
            cell.vwOpenPO.layer.borderWidth = 0.5

            cell.lblContainer.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblContainer.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblSeal.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblSeal.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblGrossWT.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblGrossWT.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblNetWT.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblNetWT.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblContainerValue.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblContainerValue.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblSealValue.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblSealValue.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblGrossWTValue.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblGrossWTValue.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblNetWTValue.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblNetWTValue.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblNo1.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblNo1.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblNo2.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblNo2.addBorder(.right, color: .black, thickness: 0.5)

            cell.lblTotal.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.lblTotal.addBorder(.right, color: .black, thickness: 0.5)

            cell.vwSave.addBorder(.bottom, color: .black, thickness: 0.5)
            cell.vwSave.addBorder(.right, color: .black, thickness: 0.5)



            //            cell.lblMaterial.text = "\(self.arrSaleList[indexPath.row].MaterialName)"
            //            cell.lblSupplier.text = "\(self.arrSaleList[indexPath.row].SupplierName)"
            //            cell.lblSaleQty.text = "\(self.arrSaleList[indexPath.row].ContractQuantity)"
            //            cell.lblSrNo.text = "\(indexPath.row + 1)"
            //            cell.lblPackaging.text = "\(self.arrSaleList[indexPath.row].PackagingTypename)"





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
        //        viewHeader.btnPlus.layer.borderWidth = 0.5
        //        viewHeader.btnPlus.layer.borderColor = UIColor.black.cgColor

        //        viewHeader.layer.borderWidth = 0.5
        //        viewHeader.layer.borderColor = UIColor.black.cgColor


        //        viewHeader.btnPlus.layer.cornerRadius = 6.0
        //        viewHeader.btnPlus.layer.masksToBounds = true
        viewHeader.lblHeaderTitle.textColor = UIColor.white

        viewHeader.backgroundColor = UIColor.systemTeal

        if section == 0
        {
            viewHeader.btnPlus.isHidden = true
        }else{
            viewHeader.btnPlus.isHidden = false
        }


         viewHeader.btnPlus.addTarget(self, action: #selector(btnPlusClick), for: .touchUpInside)
        return viewHeader
    }

    @objc func btnSaveClick(sender:UIButton)
    {



        self.view.endEditing(true)

        var dict = [String:Any]()
        var dictProduct = [String:Any]()
        var dictionary = [String:Any]()
        for(index,_) in arrPurchaseList.enumerated()
        {
           // let indexPath = self.tblSales.indexPathForRow(at: position)
            let indexpath = IndexPath(item: index, section: 0)
            let cell: InwardShipmentOpenPoCell = tblSales.cellForRow(at: indexpath) as!
                InwardShipmentOpenPoCell
            print("txtQtyReciveShipmentValue",cell.txtQtyReciveShipmentValue.text ?? "")

            if strUpdateDetailVC == "Update"
            {
                dict = ["SupplierShipmentID":SupplierShipmentID,
                        "PurchaseOrderMaterialID":arrPurchaseList[index].purchaseordermaterialid,"QuantityRecieved":cell.txtQtyReciveShipmentValue.text ?? "","IsActive":"true","SupplierShipmentPurchaseOrderMaterialID":"\(arrPurchaseList[index].SupplierShipmentPurchaseorderMaterialID)"]
            }else{
                dict = ["SupplierShipmentID":SupplierShipmentID,
                      "PurchaseOrderMaterialID":arrPurchaseList[index].purchaseordermaterialid,"QuantityRecieved":cell.txtQtyReciveShipmentValue.text ?? "","IsActive":"true","SupplierShipmentPurchaseOrderMaterialID":0]
            }


            arrResponce.append(dict)
            print("dict",dict)

        }
        dictionary = ["image_list":arrResponce]
        dictProduct = ["product":dictionary]



        print("dictProduct",dictProduct)


        AddSupplierShipmentPurchaseOrderMaterial(arr: dictProduct)
    }


    @objc func btnPlusClick(sender:UIButton)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddPackagingDetailVC") as! AddPackagingDetailVC
        vc.delegate = self
        vc.SupplierShipmentID = SupplierShipmentID
        self.present(vc, animated: true, completion: nil)

    }


    //    @objc func btnPlusClick(_sender:UIButton)
    //    {
    // dropDown.hide()
    //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //        let vc = storyboard.instantiateViewController(withIdentifier: "SalesPopVC") as! SalesPopVC
    //        vc.delegate = self
    //        vc.modalPresentationStyle = .overCurrentContext
    //        vc.modalTransitionStyle = .crossDissolve
    //        self.present(vc, animated: true, completion: nil)

    //  }
}
extension InwardShipmentVC:paymentDelegate
{
    func paymentMethod() {
        GetSupplierShipmentPackingDetailList(SupplierShipmentID: SupplierShipmentID)
    }

    @IBAction func btnClickNext(_sender:UIButton)
    {
      //  let storyboard = UIStoryboard(name: "Main", bundle: nil)
      //  let vc = storyboard.instantiateViewController(withIdentifier: "InwardShipmentDetail") as!
      //      InwardShipmentDetail
        
      //  self.navigationController?.pushViewController(vc, animated: true)
     //   self.navigationController?.popToRootViewController(animated: true)

                for controller in self.navigationController!.viewControllers as Array {
                    if controller.isKind(of: InwardShipmentListVC.self) {
                        self.navigationController!.popToViewController(controller, animated: true)
                        break
                    }
                }

    }

    @IBAction func btnClickBack()
    {
        self.navigationController?.popViewController(animated: true)
    }

    //    @IBAction func btnClickSupplier(_ sender:UIButton)
    //    {
    //        dropDown.dataSource = arrSupplier//4
    //        dropDown.anchorView = sender //5
    //        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
    //        dropDown.show() //7
    //        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
    //          guard let _ = self else { return }
    //            //self!.supplierID = self?.arrSupplierList[index].SupplierID ?? 0
    //            self?.arrSaleList.removeAll()
    //          //  self?.btnNumber.setTitle(self?.arrSupplierList[index].SupplierName ?? "", for: .normal)
    //          //  self?.txtSupplier.text = self?.arrSupplierList[index].SupplierName ?? ""
    //            self!.supplierId = "\(self!.arrSupplierList[index].SupplierID)"
    //            self?.GetPurchaseOrderListApiCall(number: "", SupplierID: "\(self!.arrSupplierList[index].SupplierID)")
    //
    //          sender.setTitle(item, for: .normal) //9
    //           // self?.getStateListApiCalling()
    //        }
    //
    //    }
}
extension InwardShipmentVC{

    func GetPurchaseOrderListApiCall(number:String,SupplierID:String)
    {
        self.arrPurchaseList.removeAll()

        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
      //  MBProgressHUD.showAdded(to: self.view, animated: true)

        var params = [String : Any]()
        params = ["GIRDNumberYear":number,"SupplierID":SupplierID]

        ApiHttpUtility.sharedUHttp.callPostMultipleApiHttpUtility(urlString: API.GetPOMaterialList, params: params) { [self] (responceJson, error) in
            if(responceJson?[Constants.Status] == "Success")
            {
                DispatchQueue.main.async {
                    MBProgressHUD.hide(for: self.view, animated: true)
                }

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

                self.totalQtyReceive = 0

                for (index,_) in self.arrPurchaseList.enumerated()
                {
                    self.totalQtyReceive = self.totalQtyReceive + Int(self.arrPurchaseList[index].AvailableQunatity)! ?? 0
                }

                //self.arrSalesPurchase
                self.GetSupplierShipmentPackingDetailList(SupplierShipmentID: self.SupplierShipmentID)

//                DispatchQueue.main.async {
//                    self.tblSales.reloadData()
//                }

            }else
            {
                DispatchQueue.main.async {
                    MBProgressHUD.hide(for: self.view, animated: true)
                }            }
        }
    }
//    func AddSalesMaterialApiCall(parameters :[String : Any])
//    {
//
//        MBProgressHUD.showAdded(to: self.view, animated: true)
//
//        //        guard let sName = txtsupplierName.text,let address1 = txtAddress1.text,let address2 = txtAddress2.text,
//        //              let zipcode = txtZipCode.text, let contactPerson = txtcontactPerson.text,
//        //              let phoneNum = txtphoneNumber.text, let email = txtemailAddress.text else {
//        //            return
//        //        }
//        //  var params = [String : Any]()
//        //   params = parameters
//        //        params = ["SalesOrderMaterialID":"0","SalesOrderID":purchaseOrderId,"MaterialID":materialId,"ContractQuantity":txtQty.text ?? 0,"RatePerMT":txtRate.text ?? 0,"CurrencyID":currancyId as Any,"AverageLoading":txtAvgLoading.text ?? 0,"PackagingID":packagingId]
//
//        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddSalesOrderMaterial, params: parameters) { (responceJson) in
//            if(responceJson[Constants.Status] == "Success")
//            {
//                MBProgressHUD.hide(for: self.view, animated: true)
//              //  self.POSOMaterial(SalesOrderMaterialID: "\(responceJson["Data"].intValue)")
//                // self.delegate?.passPuchaseObject()
//                // self.dismiss(animated: true, completion: nil)
//                //self.navigationController?.popViewController(animated: true)
//            }else
//            {
//                MBProgressHUD.hide(for: self.view, animated: true)
//            }
//        } errorComplition: { (errorMessage) in
//            MBProgressHUD.hide(for: self.view, animated: true)
//        }
//    }

    func GetSupplierShipmentPackingDetailList(SupplierShipmentID:Int)
    {
        self.arrsupplierShipmentList.removeAll()
        MBProgressHUD.showAdded(to: self.view, animated: true)
        //        guard let sName = txtsupplierName.text,let address1 = txtAddress1.text,let address2 = txtAddress2.text,
        //              let zipcode = txtZipCode.text, let contactPerson = txtcontactPerson.text,
        //              let phoneNum = txtphoneNumber.text, let email = txtemailAddress.text else {
        //            return
        //        }
        var params = [String : Any]()
        params = ["SupplierShipmentID":SupplierShipmentID]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.GetSupplierShipmentPackingDetailList, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)

                let arrData = responceJson["Data"].array
                for value in arrData! {

                    let purchaseOrderMatrialModel1:supplierShipmentModel = supplierShipmentModel.init(ContainerNumber: value["ContainerNumber"].stringValue, CreateDate: value["CreateDate"].stringValue, GrossWeight: value["GrossWeight"].stringValue, IsActive: value["IsActive"].stringValue, NetWeight: value["NetWeight"].stringValue, SealNumber: value["SealNumber"].stringValue, SupplierShipmentID: value["SupplierShipmentID"].stringValue, SupplierShipmentPackingDetailID: value["SupplierShipmentPackingDetailID"].stringValue)
                    self.arrsupplierShipmentList.append(purchaseOrderMatrialModel1)
                }
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }

            DispatchQueue.main.async {
                self.tblSales.reloadData()
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

                //    self.GetPurchaseOrderListApiCall(number: self.strPoNumber, SupplierID: self.supplierId)
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

    func AddSupplierShipmentPurchaseOrderMaterial(arr:[String:Any])
    {

        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }

        let url = URL(string: API.AddSupplierShipmentPurchaseOrderMaterial)!
        var request = URLRequest(url: url)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = try! JSONSerialization.data(withJSONObject: arr, options:.prettyPrinted)

        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in

            DispatchQueue.main.async {
                MBProgressHUD.hide(for: self.view, animated: true)
            }

            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  error == nil else {                                              // check for fundamental networking error
                print("error", error ?? "Unknown error")
                return
            }


            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }

            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(String(describing: responseString))")
            let dictResponce = responseString?.toJSON() as? [String:AnyObject] ?? [:]

            self.GetPurchaseOrderListApiCall(number: "", SupplierID: "\(self.supplierId)")



//            DispatchQueue.main.async {
//                self.tblSales.reloadData()
//            }


//            if(dictResponce[Constants.Status] as! String == "Success")
//            {
//
//            }

        }

        task.resume()

    }


//    func AddSupplierShipmentPurchaseOrderMaterial(arr:[String:Any])
//        {
//            //self.arrSaleList.removeAll()
//    //        var params = [String : Any]()
//    //        params = ["SalesOrderID":salesOrderId]
//
//            //print("params",params)
//
//            MBProgressHUD.showAdded(to: self.view, animated: true)
//
//
//            let urlString = API.AddSupplierShipmentPurchaseOrderMaterial
//               //
//          //  let json = "{\"What\":\"Ever\"}"
//
//            let url = URL(string: urlString)!
//
//      //  let data = try! JSONSerialization.data(withJSONObject: arr, options:.prettyPrinted)
//
//
//
//            var request = URLRequest(url: url)
//            request.httpMethod = HTTPMethod.post.rawValue
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//      //  let newString = String(data: arr, encoding: .utf8)
////        let jsonData:Data!
////        do {
////         jsonData = try JSONSerialization.data(withJSONObject: newString, options: .prettyPrinted)
////           //
////           // print(newString!)
////        } catch
////        {
////            print(error)
////        }
//
//        var jsonData:Data!
//        do {
//            jsonData = try JSONSerialization.data(withJSONObject: arr, options: [])
//            if let jsonString = String(data: jsonData, encoding: String.Encoding.utf8) {
//                print(jsonString)
//            }
//        } catch {
//            print(error)
//        }
//        request.httpBody = jsonData
//
//
//        Alamofire.request(request).responseJSON { (response) in
//
//            print("Success: \(response)")
//            switch response.result{
//            case .success:
//                let statusCode: Int = (response.response?.statusCode)!
//                switch statusCode{
//                case 200:
//                    let json = JSON(response.result)
//                    //Bhargav Hide
//
//                    MBProgressHUD.hide(for: self.view, animated: true)
//
//                    if(json[Constants.Status] == "Success") {
//                        print("persion detail",json)
//                    }
//
//
//                    break
//                default:
//                    MBProgressHUD.hide(for: self.view, animated: true)
//                    break
//                }
//                break
//            case .failure:
//                MBProgressHUD.hide(for: self.view, animated: true)
//                break
//            }
//        }
//
//
////            ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddSupplierShipmentPurchaseOrderMaterial, params: params) { (responceJson) in
////                if(responceJson[Constants.Status] == "Success")
////                {
////                    MBProgressHUD.hide(for: self.view, animated: true)
////                   // self.getCityListApiCalling()
////                    let arrData = responceJson["Data"].array
////                    for value in arrData! {
////
////                        let purchaseOrderMatrialModel1:saleOrderMatrialModel = saleOrderMatrialModel.init(SalesOrderMaterialID: value["SalesOrderMaterialID"].intValue, ContractQuantity: value["ContractQuantity"].stringValue, RatePerMT: value["RatePerMT"].stringValue, AverageLoading: value["AverageLoading"].stringValue, CurrencyAbbr: value["CurrencyAbbr"].stringValue, PackagingTypename: value["PackagingTypename"].stringValue, MaterialName: value["MaterialName"].stringValue,MaterialID: value["MaterialID"].intValue,CurrencyID: value["CurrencyID"].intValue,PackagingTypeID: value["PackagingTypeID"].intValue,SalesOrderID: value["SalesOrderID"].intValue,SupplierName: value["SupplierName"].stringValue,CurrencyName: value["CurrencyName"].stringValue)
////                        self.arrSaleList.append(purchaseOrderMatrialModel1)
////                    }
////
////                //    self.GetPurchaseOrderListApiCall(number: self.strPoNumber, SupplierID: self.supplierId)
////    //                DispatchQueue.main.async {
////    //                    self.tblSales.reloadData()
////    //                }
////
////                }else
////                {
////                    MBProgressHUD.hide(for: self.view, animated: true)
////                }
////            } errorComplition: { (errorMessage) in
////                MBProgressHUD.hide(for: self.view, animated: true)
////            }
//        }
}
//extension InwardShipmentVC:UITextFieldDelegate{
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
//    {
//        print("dsfdsfdsfdsf",string)
//        var str = textField.text ?? ""
//        print("str",str)
//
//      //  GetPurchaseOrderListApiCall(number: textField.text ?? "")
//        return true
//    }
//}

extension UIView {
    func addBorder(_ edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.backgroundColor = color
        self.addSubview(subview)
        switch edge {
        case .top, .bottom:
            subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
            subview.heightAnchor.constraint(equalToConstant: thickness).isActive = true
            if edge == .top {
                subview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            } else {
                subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            }
        case .left, .right:
            subview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            subview.widthAnchor.constraint(equalToConstant: thickness).isActive = true
            if edge == .left {
                subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            } else {
                subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
            }
        default:
            break
        }
    }
}

extension Dictionary {
    func percentEncoded() -> Data? {
        return map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}
extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
