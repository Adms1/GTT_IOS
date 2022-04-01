//
//  AddCourancyVC.swift
//  GTT
//
//  Created by ADMS on 21/02/22.
//

import UIKit
import MBProgressHUD

protocol AddCurrencyDelegate: class {
    func addAddCurrencyDelegate()
    func CancelAddCurrencyDelegate()
}
class AddCourancyVC: UIViewController {

    weak var currencyDelagate:AddCurrencyDelegate?
    
    @IBOutlet weak var btnSubmit:UIButton!
    @IBOutlet weak var btnCancel:UIButton!

    @IBOutlet weak var txtCurrancyName:UITextField!
    @IBOutlet weak var txtCurrencyAbbr:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

//        btnSubmit.layer.cornerRadius = 6.0
//        btnSubmit.layer.masksToBounds = true
//        btnCancel.layer.cornerRadius = 6.0
//        btnCancel.layer.masksToBounds = true

    }
    func validated() -> Bool
    {
        var valid: Bool = true

        let Name = txtCurrancyName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cAbbr =  txtCurrencyAbbr.text!.trimmingCharacters(in: .whitespacesAndNewlines)


        if Name == ""
        {
            self.view.makeToast("please enter currancy name")
            valid = false
        }else if cAbbr == ""
        {
            self.view.makeToast("please enter currancy abbr")
            valid = false
        }
        return valid
    }
}
extension AddCourancyVC{
    @IBAction func btnClickAdd()
    {
        if validated() == true
        {
            addCurrencyApiCalling()
        }
    }
    @IBAction func btnClickCancel()
    {
        self.dismiss(animated: true, completion: nil)
        currencyDelagate?.CancelAddCurrencyDelegate()
    }
}
extension AddCourancyVC
{
    func addCurrencyApiCalling()
    {
        MBProgressHUD.showAdded(to: self.view, animated: true)

        guard let name = txtCurrancyName.text, let currancyabbr = txtCurrencyAbbr.text  else {
            return
        }
        var params = [String : Any]()
        params = ["CurrencyName":name,"CurrencyAbbr":currancyabbr]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.AddCurrency, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.currencyDelagate?.addAddCurrencyDelegate()
                self.dismiss(animated: true, completion: nil)
            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}
