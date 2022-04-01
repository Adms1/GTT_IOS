//
//  SalesOrderVC.swift
//  GTT
//
//  Created by ADMS on 16/02/22.

import UIKit
import DropDown
import MBProgressHUD
import Alamofire




class SalesOrderVC: UIViewController {

  //  @IBOutlet weak var headerVw:HeaderView!
    @IBOutlet weak var tblsales:UITableView!
//    @IBOutlet weak var btnSupplier:UIButton!
//    @IBOutlet weak var btnSupplierPlus:UIButton!
    @IBOutlet weak var btnNext:UIButton!

    var arrpurchaseOrderMatrialList = [saleOrderMatrialModel]()

    var arrPurchaseList = [purchseModel]()
    var arrSupplierList = [String]()

    let dropDown = DropDown()

    var purchaseOrderId:Int = 0

    var selectedIndex:Int = 0

    var updatePurchaseOrder:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

//        let userDefaults = UserDefaults.standard
//        purchaseOrderId = userDefaults.value(forKey: "IsPurchaseOrederValue") as! Int
//        print("purchaseOrderId",purchaseOrderId)

        self.navigationController?.navigationBar.isHidden = true

//        btnNext.layer.cornerRadius = 6.0
//        btnNext.layer.masksToBounds = true

        let nibName = UINib(nibName: "PurchaseHeaderCell", bundle: nil)
        self.tblsales.register(nibName, forCellReuseIdentifier: "PurchaseHeaderCell")

        self.tblsales.register(UINib(nibName: "PurchaseCell", bundle: nil), forCellReuseIdentifier: "PurchaseCell")

    }

    override func viewWillAppear(_ animated: Bool) {
        GetPurchaseOrderMaterialApiCall()
    }
}

extension SalesOrderVC
{
    @IBAction func btnClickNext(_sender:UIButton)
    {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: SalesOrderListVC.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }

    @IBAction func btnClickBAck()
    {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SalesOrderVC:UITableViewDelegate,UITableViewDataSource
{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if self.arrpurchaseOrderMatrialList.count != 0
        {
            return self.arrpurchaseOrderMatrialList.count
        }else{
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseCell", for: indexPath) as! PurchaseCell

        cell.lblMaterial.text = ": \(self.arrpurchaseOrderMatrialList[indexPath.row].MaterialName)"
        cell.lblRate.text = ": \(self.arrpurchaseOrderMatrialList[indexPath.row].RatePerMT)"
        cell.lblCurrency.text = ": \(self.arrpurchaseOrderMatrialList[indexPath.row].CurrencyAbbr)"
        cell.lblAvgLoading.text = ": \(self.arrpurchaseOrderMatrialList[indexPath.row].AverageLoading)"
        cell.lblContractQty.text = ": \(self.arrpurchaseOrderMatrialList[indexPath.row].ContractQuantity)"

        cell.selectionStyle = .none
        cell.btnDelete.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(btnDeleteClick), for: .touchUpInside)

        cell.btnEdit.tag = indexPath.row
        cell.btnEdit.addTarget(self, action: #selector(btnEditClick), for: .touchUpInside)

        cell.purchaseVw.layer.cornerRadius = 4.0
        cell.purchaseVw.layer.masksToBounds = true

        cell.purchaseVw.layer.borderWidth = 0.5
        cell.purchaseVw.layer.borderColor = UIColor.lightGray.cgColor

        return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = tableView.dequeueReusableCell(withIdentifier: "PurchaseHeaderCell") as! PurchaseHeaderCell
        viewHeader.btnPlus.tag = section
        viewHeader.lblHeaderTitle.text = "Material in this P.O"
        viewHeader.btnPlus.addTarget(self, action: #selector(btnPlusClick), for: .touchUpInside)
        return viewHeader
    }
    @objc func btnEditClick(_ sender:UIButton)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "UpdateSalesPopUpVC") as! UpdateSalesPopUpVC
        vc.objPurchaseOrder = arrpurchaseOrderMatrialList[sender.tag]
        vc.purchaseOrderId = purchaseOrderId
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)

    }
    @objc func btnDeleteClick(_sender:UIButton)
    {
        let alertController = UIAlertController(title: "", message: "Are you sure you want to delete purchase materal order?", preferredStyle:UIAlertController.Style.alert)

        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        { action -> Void in
            self.selectedIndex = Int(self.arrpurchaseOrderMatrialList[_sender.tag].SalesOrderMaterialID)
            let indexPath = IndexPath(row: _sender.tag, section: 0)
            self.arrpurchaseOrderMatrialList.remove(at: Int(indexPath.row))
            self.DeletePurchaseOrderMaterialApiCall()
            //self.tblPurchase.reloadData()
        })
        alertController.addAction(UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.destructive)
        { action -> Void in
          return
        })
        self.present(alertController, animated: true, completion: nil)
    }

    @objc func btnPlusClick(_sender:UIButton)
    {
       // dropDown.hide()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SalesPopVC") as! SalesPopVC
        vc.purchaseOrderId = purchaseOrderId
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
       // self.navigationController?.pushViewController(vc, animated: false)

    }

    @IBAction func btnClickSupplierPlus(_sender:UIButton)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SupplierVC") as! SupplierVC
        self.navigationController?.pushViewController(vc, animated: true)
//        vc.delegate = self
//        vc.strPopText = "Supplier"
//        vc.modalPresentationStyle = .overCurrentContext
//        vc.modalTransitionStyle = .crossDissolve
//        self.present(vc, animated: true, completion: nil)

    }

    @IBAction func btnSupplierClick(_ sender: UIButton)
    {
        dropDown.dataSource = arrSupplierList//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
          sender.setTitle(item, for: .normal) //9
        }
    }

}
extension SalesOrderVC{
    func GetPurchaseOrderMaterialApiCall()
    {
        self.arrpurchaseOrderMatrialList.removeAll()
        var params = [String : Any]()
        params = ["SalesOrderID":purchaseOrderId]

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
                    self.arrpurchaseOrderMatrialList.append(purchaseOrderMatrialModel1)
                }

                DispatchQueue.main.async {
                    self.tblsales.reloadData()
                }

            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }

    func DeletePurchaseOrderMaterialApiCall()
    {

        var params = [String : Any]()
        params = ["PurchaseOrderMaterialID":selectedIndex]

        print("params",params)

        MBProgressHUD.showAdded(to: self.view, animated: true)

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.DeletePurchaseOrderMaterial, params: params) { (responceJson) in
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

                DispatchQueue.main.async {
                    self.tblsales.reloadData()
                }

            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}
extension SalesOrderVC:purchaseDelegate,supplierDelegate
{
    func passSupplierModelObject() {
      //  self.arrSupplierList.append(obj)
    }

    func passPuchaseObject() {
       // arrPurchaseList.append(obj)
        GetPurchaseOrderMaterialApiCall()
    }


}




