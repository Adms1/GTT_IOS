//
//  LoginVC.swift
//  GTT
//
//  Created by ADMS on 21/02/22.
//

import UIKit
import Toast_Swift
import MBProgressHUD

class LoginVC: UIViewController {

    @IBOutlet weak var btnLogin:UIButton!
    @IBOutlet weak var btnRegister:UIButton!
    @IBOutlet weak var txtEmail:UITextField!
    @IBOutlet weak var txtPassword:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        txtEmail.layer.borderWidth = 0.5
        txtEmail.layer.borderColor = UIColor.black.cgColor

        txtPassword.layer.borderWidth = 0.5
        txtPassword.layer.borderColor = UIColor.black.cgColor


        txtEmail.layer.cornerRadius = 6.0
        txtEmail.layer.masksToBounds = true

        txtPassword.layer.cornerRadius = 6.0
        txtPassword.layer.masksToBounds = true

        self.navigationController?.navigationBar.isHidden = true

    }
    @IBAction func btnClickLogin()
    {
        if validated() == true
        {
            loginApiCall()
        }
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "OrderVC") as! OrderVC
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnClickRegister()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func validated() -> Bool
    {
        var valid: Bool = true

        let EmailMobile = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let Password =  txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)


        if EmailMobile == ""
        {
            self.view.makeToast("Please enter email")
//            let toast =  Toast(text: (NSLocalizedString("Digo_error_msg1", comment: "")), duration: 3.0)
//            toast.show()


            valid = false
        }
        else if !EmailMobile.isValidEmail()
        {
            self.view.makeToast("Please enter valid email")
            valid = false
        }
        else if Password == ""
        {
//            let toast =  Toast(text: (NSLocalizedString("Digo_error_msg2", comment: "")), duration: 3.0)
//            toast.show()

            self.view.makeToast("Please enter password")
            valid = false
        }
        return valid
    }
}
extension LoginVC{
    func loginApiCall()
    {

        MBProgressHUD.showAdded(to: self.view, animated: true)

        guard let emailMobile = txtEmail.text, let password = txtPassword.text  else {
            return
        }
        var params = [String : Any]()
        params = ["email":emailMobile,"pass":password]

        ApiHttpUtility.sharedUHttp.callPostHttpUtility(urlString: API.CheckUser, params: params) { (responceJson) in
            if(responceJson[Constants.Status] == "Success")
            {
                MBProgressHUD.hide(for: self.view, animated: true)

                print("user login status",responceJson[Constants.Status])
                print("user login responce",responceJson["Data"])
                let jsonArray = responceJson["Data"].dictionaryObject!
                UserDefaults.standard.set(jsonArray["UserID"], forKey: "logindata")
                UserDefaults.standard.set("1", forKey: "isLogin")

                let appDelegate = UIApplication.shared.delegate as! AppDelegate

                let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OrderVC") as! OrderVC

                let frontNavigationController = UINavigationController(rootViewController: rootVC)
                appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
                appDelegate.window?.rootViewController = frontNavigationController
                appDelegate.window?.makeKeyAndVisible()

            }else
            {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        } errorComplition: { (errorMessage) in
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}
