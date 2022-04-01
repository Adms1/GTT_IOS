//
//  PurchaseOrderListVC.swift
//  GTT
//
//  Created by ADMS on 07/03/22.
//

import UIKit
import MBProgressHUD
import Toast_Swift
import Alamofire

class PurchaseOrderListVC: UIViewController
{
    @IBOutlet weak var tblPurchaseOrder:UITableView!
    @IBOutlet weak var btnPurchaseOrder:UIButton!
    @IBOutlet weak var lblNoDataFound:UILabel!

    var arrpurchaseOrderList = [purchaseOrderListModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

        let nibName = UINib(nibName: "PurchaseOderCell", bundle: nil)
        self.tblPurchaseOrder.register(nibName, forCellReuseIdentifier: "PurchaseOderCell")

        btnPurchaseOrder.layer.cornerRadius = btnPurchaseOrder.layer.frame.width/2
        btnPurchaseOrder.layer.masksToBounds = true
    }
    override func viewWillAppear(_ animated: Bool) {
        GetPurchaseOrderListApiCall()
    }
}
extension PurchaseOrderListVC
{
    @IBAction func btnClickPurchaseOrder()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PurchaseOrderVC2") as! PurchaseOrderVC2
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func btnClickBAck()
    {
        self.navigationController?.popViewController(animated: true)
    }
}
extension PurchaseOrderListVC:UITableViewDelegate,UITableViewDataSource
{

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.arrpurchaseOrderList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseOderCell", for: indexPath) as! PurchaseOderCell

        cell.lblSupplierName.text = ": \(self.arrpurchaseOrderList[indexPath.row].SupplierName)"
        cell.lblEquipmentTypeName.text = ": \(self.arrpurchaseOrderList[indexPath.row].EquipmentTypeName)"
        cell.lblFinalPlaceOfDelivery.text = ": \(self.arrpurchaseOrderList[indexPath.row].FinalPlaceOfDelivery)"
        cell.lblDeliveryTerm.text = ": \(self.arrpurchaseOrderList[indexPath.row].DeliveryTerm)"
        cell.lblPaymentTerm.text = ": \(self.arrpurchaseOrderList[indexPath.row].PaymentTerm)"

        cell.selectionStyle = .none
        cell.btnEdit.tag = indexPath.row
        cell.btnEdit.addTarget(self, action: #selector(btnEditClick), for: .touchUpInside)
        cell.purchaseVw.layer.cornerRadius = 4.0
        cell.purchaseVw.layer.masksToBounds = true

        cell.purchaseVw.layer.borderWidth = 0.5
        cell.purchaseVw.layer.borderColor = UIColor.lightGray.cgColor

        return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }

    @objc func btnEditClick(_ sender:UIButton)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "UpdatePurchaseOrderVC") as! UpdatePurchaseOrderVC
        vc.objPurchaseOrder = arrpurchaseOrderList[sender.tag]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension PurchaseOrderListVC{
    func GetPurchaseOrderListApiCall()
    {
        self.arrpurchaseOrderList.removeAll()
//        var params = [String : Any]()
//        params = ["PurchaseOrderID":purchaseOrderId]

       // print("params",params)

        MBProgressHUD.showAdded(to: self.view, animated: true)


        ApiHttpUtility.sharedUHttp.callGetHttpUtility(urlString: API.GetPurchaseOrderList) { (responceJson) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if(responceJson[Constants.Status] == "Success")
            {
                print(responceJson)
               // self.getStateListApiCalling()


                let arrData = responceJson["Data"].array
                for value in arrData! {

                    let purchaseOrderMatrialModel1:purchaseOrderListModel = purchaseOrderListModel.init(PurchaseOrderID: value["PurchaseOrderID"].stringValue, GridNumber: value["GridNumber"].stringValue,GridYear: value["GridYear"].stringValue, SupplierContractID: value["SupplierContractID"].stringValue, Tolerance: value["Tolerance"].stringValue, SupplierName: value["SupplierName"].stringValue, EquipmentTypeName: value["EquipmentTypeName"].stringValue, CountryOfOrigin: value["CountryOfOrigin"].stringValue, PortOfLoading: value["PortOfLoading"].stringValue, PortOfDischarge: value["PortOfDischarge"].stringValue, FinalPlaceOfDelivery: value["FinalPlaceOfDelivery"].stringValue, PaymentTerm: value["PaymentTerm"].stringValue, DeliveryTerm: value["DeliveryTerm"].stringValue, CountryOfDischarge: value["CountryOfDischarge"].stringValue, SupplierID: value["SupplierID"].intValue, EnquipmentTypeID: value["EnquipmentTypeID"].intValue, CountryOfOriginID: value["CountryOfOriginID"].intValue, PortOfLoadingID: value["PortOfLoadingID"].intValue, PortOfDischargeID: value["PortOfDischargeID"].intValue, FinalPlaceOfDeliveryID: value["FinalPlaceOfDeliveryID"].intValue, PaymentTermID: value["PaymentTermID"].intValue, DeliveryTermID: value["DeliveryTermID"].intValue,CountryOfDischargeID: value["CountryOfDischargeID"].intValue,EquipmentCount: value["EquipmentCount"].intValue)
                    self.arrpurchaseOrderList.append(purchaseOrderMatrialModel1)
                }
                if self.arrpurchaseOrderList.count == 0
                {
                    self.lblNoDataFound.isHidden = false
                }
                DispatchQueue.main.async {
                    self.tblPurchaseOrder.reloadData()
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
