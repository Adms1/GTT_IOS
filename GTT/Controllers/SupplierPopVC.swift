////
////  SupplierPopVC.swift
////  GTT
////
////  Created by ADMS on 15/02/22.
////
//
//import UIKit
//
//protocol supplierDelegate:class {
//    func passSupplierModelObject(obj:String)
//}
//
//
//class SupplierPopVC: UIViewController {
//
//    @IBOutlet weak var txtSupplier:UITextField!
//    @IBOutlet weak var btnSubmit:UIButton!
//    @IBOutlet weak var btnCancel:UIButton!
//
//    @IBOutlet weak var purchaseVw:UIView!
//
//    @IBOutlet weak var popupText:UILabel!
//
//    var strPopText:String?
//
//    weak var delegate:supplierDelegate?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        popupText.text = strPopText ?? ""
//
//        btnSubmit.layer.cornerRadius = 6.0
//        btnSubmit.layer.masksToBounds = true
//
//        btnCancel.layer.cornerRadius = 6.0
//        btnCancel.layer.masksToBounds = true
//
//
//
//    }
//}
//extension SupplierPopVC
//{
//    @IBAction func btnSubmitClick(_sender:UIButton)
//    {
//      //  let object = supplierModel(supplier: )
//        delegate?.passSupplierModelObject(obj: txtSupplier.text ?? "")
//        self.dismiss(animated: true, completion: nil)
//    }
//    @IBAction func btnCancelClick(_sender:UIButton)
//    {
//        self.dismiss(animated: true, completion: nil)
//    }
//}
