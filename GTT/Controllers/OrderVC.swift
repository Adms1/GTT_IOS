//
//  OrderVC.swift
//  GTT
//
//  Created by ADMS on 16/02/22.
//

import UIKit

class OrderVC: UIViewController {

    @IBOutlet weak var btnPurchaseOrder:UIButton!
    @IBOutlet weak var btnSalesOrder:UIButton!

    let array: [[String: Any]] = [
        [
            "firstName": "John",
            "lastName": "Smith"
        ],
        [
            "make": "Ford",
            "model": "Focus",
            "year": 2016
        ]
    ]


    override func viewDidLoad() {
        super.viewDidLoad()

//        print(array.toJSONString())
//        let str = try! toJSON(array: array)
//        print(str)
//        let array2 = try! fromJSON(string: str)
//
//        print(array2)


//        btnPurchaseOrder.layer.cornerRadius = 6.0
//        btnPurchaseOrder.layer.masksToBounds = true
//
//        btnSalesOrder.layer.cornerRadius = 6.0
//        btnSalesOrder.layer.masksToBounds = true

        self.navigationController?.navigationBar.isHidden = true

    }
    func toJSON(array: [[String: Any]]) throws -> String {
        let data = try JSONSerialization.data(withJSONObject: array, options: [])
        return String(data: data, encoding: .utf8)!
    }

    func fromJSON(string: String) throws -> [[String: Any]] {
        let data = string.data(using: .utf8)!
        guard let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject] else {
            throw NSError(domain: NSCocoaErrorDomain, code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid JSON"])
        }
        return jsonObject.map { $0 as! [String: Any] }
    }


}
extension OrderVC{
    @IBAction func btnClickPurchaseOrder()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PurchaseOrderListVC") as! PurchaseOrderListVC
        self.navigationController?.pushViewController(vc, animated: true)

    }
    @IBAction func btnClickSalesOrder()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SalesOrderListVC") as! SalesOrderListVC
        self.navigationController?.pushViewController(vc, animated: true)

    }

    @IBAction func btnClickInwardShipment()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "InwardShipmentListVC") as! InwardShipmentListVC
        self.navigationController?.pushViewController(vc, animated: true)

    }


}
extension Collection where Iterator.Element == [String: Any] {
  func toJSONString(options: JSONSerialization.WritingOptions = .prettyPrinted) -> String {
    if let arr = self as? [[String: Any]],
       let dat = try? JSONSerialization.data(withJSONObject: arr, options: options),
       let str = String(data: dat, encoding: String.Encoding.utf8) {
      return str
    }
    return "[]"
  }
}
