
import UIKit
import MBProgressHUD
import Toast_Swift
import Alamofire

class SalesOrderListVC: UIViewController
{
    @IBOutlet weak var tblPurchaseOrder:UITableView!
    @IBOutlet weak var btnPurchaseOrder:UIButton!

    @IBOutlet weak var lblNoDataFound:UILabel!


    var arrsaleOrderList = [saleOrderListModel]()

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
extension SalesOrderListVC
{
    @IBAction func btnClickPurchaseOrder()
    {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "SaleOrderVC2") as! SaleOrderVC2
//        self.navigationController?.pushViewController(vc, animated: true)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SaleOrderVC2") as! SaleOrderVC2
        self.navigationController?.pushViewController(vc, animated: true)

    }

    @IBAction func btnClickBAck()
    {
        self.navigationController?.popViewController(animated: true)
    }
}
extension SalesOrderListVC:UITableViewDelegate,UITableViewDataSource
{

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.arrsaleOrderList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseOderCell", for: indexPath) as! PurchaseOderCell

        cell.lblSupplierName.text = ": \(self.arrsaleOrderList[indexPath.row].SupplierName)"
        cell.lblEquipmentTypeName.text = ": \(self.arrsaleOrderList[indexPath.row].EquipmentTypeName)"
        cell.lblFinalPlaceOfDelivery.text = ": \(self.arrsaleOrderList[indexPath.row].FinalPlaceOfDelivery)"
        cell.lblDeliveryTerm.text = ": \(self.arrsaleOrderList[indexPath.row].DeliveryTerm)"
        cell.lblPaymentTerm.text = ": \(self.arrsaleOrderList[indexPath.row].PaymentTerm)"

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
        let vc = storyboard.instantiateViewController(withIdentifier: "UpdateSalesOrderVC") as! UpdateSalesOrderVC
        vc.objPurchaseOrder = arrsaleOrderList[sender.tag]
        self.navigationController?.pushViewController(vc, animated: true)

    }
}
extension SalesOrderListVC{
    func GetPurchaseOrderListApiCall()
    {
        self.arrsaleOrderList.removeAll()
//        var params = [String : Any]()
//        params = ["PurchaseOrderID":purchaseOrderId]

       // print("params",params)

        MBProgressHUD.showAdded(to: self.view, animated: true)


        ApiHttpUtility.sharedUHttp.callGetHttpUtility(urlString: API.GetSalesOrderList) { (responceJson) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if(responceJson[Constants.Status] == "Success")
            {
                print(responceJson)
               // self.getStateListApiCalling()


                let arrData = responceJson["Data"].array
                for value in arrData! {

                    let purchaseOrderMatrialModel1:saleOrderListModel = saleOrderListModel.init(SalesOrderID: value["SalesOrderID"].stringValue, GridNumber: value["GridNumber"].stringValue,GridYear: value["GridYear"].stringValue, BuyerContractID: value["BuyerContractID"].stringValue, Tolerance: value["Tolerance"].stringValue, SupplierName: value["SupplierName"].stringValue, EquipmentTypeName: value["EquipmentTypeName"].stringValue, CountryOfOrigin: value["CountryOfOrigin"].stringValue, PortOfLoading: value["PortOfLoading"].stringValue, PortOfDischarge: value["PortOfDischarge"].stringValue, FinalPlaceOfDelivery: value["FinalPlaceOfDelivery"].stringValue, PaymentTerm: value["PaymentTerm"].stringValue, DeliveryTerm: value["DeliveryTerm"].stringValue, CountryOfDischarge: value["CountryOfDischarge"].stringValue, BuyerID: value["BuyerID"].intValue, EquipmentTypeID: value["EquipmentTypeID"].intValue, CountryOfOriginID: value["CountryOfOriginID"].intValue, PortOfLoadingID: value["PortOfLoadingID"].intValue, PortOfDischargeID: value["PortOfDischargeID"].intValue, FinalPlaceOfDeliveryID: value["FinalPlaceOfDeliveryID"].intValue, PaymentTermID: value["PaymentTermID"].intValue, DeliveryTermID: value["DeliveryTermID"].intValue,CountryOfDischargeID: value["CountryOfDischargeID"].intValue,EquipmentCount: value["EquipmentCount"].intValue,UserID: value["UserID"].intValue,AdvanceType: value["AdvanceType"].intValue,AdvanceAmount: value["AdvanceAmount"].intValue)
                    self.arrsaleOrderList.append(purchaseOrderMatrialModel1)
                }

                if self.arrsaleOrderList.count == 0
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

