//
//  InwardShipmentListVC.swift
//  GTT
//
//  Created by ADMS on 25/03/22.
//

import UIKit
import MBProgressHUD
import Toast_Swift
import Alamofire

class InwardShipmentListVC: UIViewController
{
    @IBOutlet weak var tblPurchaseOrder:UITableView!
    @IBOutlet weak var btnPurchaseOrder:UIButton!

    @IBOutlet weak var lblNoDataFound:UILabel!


    var arrsaleOrderList = [ShipmentListModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

        let nibName = UINib(nibName: "ShipmentCell", bundle: nil)
        self.tblPurchaseOrder.register(nibName, forCellReuseIdentifier: "ShipmentCell")

        btnPurchaseOrder.layer.cornerRadius = btnPurchaseOrder.layer.frame.width/2
        btnPurchaseOrder.layer.masksToBounds = true
    }
    override func viewWillAppear(_ animated: Bool) {
        GetPurchaseOrderListApiCall()
    }
}
extension InwardShipmentListVC
{
    @IBAction func btnClickPurchaseOrder()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "InwardShipmentDetail") as! InwardShipmentDetail
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func btnClickBAck()
    {
        self.navigationController?.popViewController(animated: true)
    }
}
extension InwardShipmentListVC:UITableViewDelegate,UITableViewDataSource
{

    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        return 1
    //    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.arrsaleOrderList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShipmentCell", for: indexPath) as! ShipmentCell

        cell.lblSupplierName.text = ": \(self.arrsaleOrderList[indexPath.row].blno)"
        cell.lblEquipmentTypeName.text = ": \(self.arrsaleOrderList[indexPath.row].bldate)"
        cell.lblFinalPlaceOfDelivery.text = ": \(self.arrsaleOrderList[indexPath.row].suppliername)"
        cell.lblDeliveryTerm.text = ": \(self.arrsaleOrderList[indexPath.row].vesselName)"
        cell.lblPaymentTerm.text = ": \(self.arrsaleOrderList[indexPath.row].shippinglinename)"

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
        let vc = storyboard.instantiateViewController(withIdentifier: "InwardShipmentDetail") as! InwardShipmentDetail
        vc.strUpdateDetailVC = "Edit"
        vc.obj = arrsaleOrderList[sender.tag]
        self.navigationController?.pushViewController(vc, animated: true)

        

    }
}
extension InwardShipmentListVC{
    func GetPurchaseOrderListApiCall()
    {
        self.arrsaleOrderList.removeAll()
        //        var params = [String : Any]()
        //        params = ["PurchaseOrderID":purchaseOrderId]

        // print("params",params)

        MBProgressHUD.showAdded(to: self.view, animated: true)


        ApiHttpUtility.sharedUHttp.callGetHttpUtility(urlString: API.GetSupplierShipmentList) { (responceJson) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if(responceJson[Constants.Status] == "Success")
            {
                print(responceJson)
                // self.getStateListApiCalling()


                let arrData = responceJson["Data"].array
                for value in arrData! {

                    let purchaseOrderMatrialModel1:ShipmentListModel = ShipmentListModel.init(suppliershipmentid: value["suppliershipmentid"].stringValue, blno: value["blno"].stringValue, bldate: value["bldate"].stringValue, vesselName: value["vesselName"].stringValue, suppliername: value["suppliername"].stringValue, shippinglinename: value["shippinglinename"].stringValue, supplierid: value["supplierid"].stringValue, shippinglineid: value["shippinglineid"].stringValue, originalplaceofloadingid: value["originalplaceofloadingid"].stringValue, portofloadingid: value["portofloadingid"].stringValue, countryofloadingid: value["countryofloadingid"].stringValue, countryofdeliveryid: value["countryofdeliveryid"].stringValue, portofdischargeid: value["portofdischargeid"].stringValue, finalplaceofdeliveryid: value["finalplaceofdeliveryid"].stringValue, countryofloading: value["countryofloading"].stringValue, countryofdelivery: value["countryofdelivery"].stringValue, portofloading: value["portofloading"].stringValue, portofdischarge: value["portofdischarge"].stringValue, finalplaceOfdelivery: value["finalplaceOfdelivery"].stringValue, originplaceofreceipt: value["originplaceofreceipt"].stringValue)
                    self.arrsaleOrderList.append(purchaseOrderMatrialModel1)
                }

                if self.arrsaleOrderList.count == 0
                {
                    self.lblNoDataFound.isHidden = false
                }else{
                    self.lblNoDataFound.isHidden = true

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





