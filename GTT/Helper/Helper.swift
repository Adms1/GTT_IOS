//
//  Helper.swift
//  DIGO
//
//  Created by ADMS on 22/10/21.
//

import Foundation
import UIKit

var razorpayKey = "rzp_test_5CMT01q5qHF9iS" //test
//var razorpayKey = "rzp_live_ACc68Sz0Iyoahn" //Live


struct API {



    static let strVersion:String  = "Ver. No.: 1.620200407"
    static let strGameID:String   = "6616E8DC-917C-473D-ACA1-4540D7AC9488"

    static let hostName:String    = "http://gtt.admsonline.com/" //"\(bundleDisplayName == "TestCraft" ? "https://webservice.testcraft.in/" : "http://demowebservice.testcraft.in/")" //"LIVE" : "TEST"
    static let baseUrl:String     = "\(hostName)GTTService.asmx/"

    static let imageUrl:String     = "http://digo.admssvc.com/Product_Images/"

    static let ADDUSER = "\(baseUrl)AddUser"
    static let CheckUser = "\(baseUrl)CheckUser"
    static let AddMaterial = "\(baseUrl)AddMaterial"
    static let AddPackagingType = "\(baseUrl)AddPackagingType"
    static let AddCurrency = "\(baseUrl)AddCurrency"
    static let AddSupplierShipmentPurchaseOrderMaterial = "\(baseUrl)AddSupplierShipmentPurchaseOrderMaterial"


    static let AddSupplierShipmentPackingDetail = "\(baseUrl)AddSupplierShipmentPackingDetail"

    static let AddShippingLine = "\(baseUrl)AddShippingLine"

    static let AddCountry = "\(baseUrl)AddCountry"
    static let AddCountryState = "\(baseUrl)AddCountryState"
    static let AddCountryStateCity = "\(baseUrl)AddCountryStateCity"
    static let AddSupplier = "\(baseUrl)AddSupplier"
    static let AddEquipment = "\(baseUrl)AddEquipment"
    static let AddCountryPort = "\(baseUrl)AddCountryPort"
    static let AddCountryPortPlace = "\(baseUrl)AddCountryPortPlace"

    static let GetCountryList = "\(baseUrl)GetCountryList"
    static let GetPurchaseOrderMaterial = "\(baseUrl)GetPurchaseOrderMaterial"

    static let GetSalesOrderMaterial = "\(baseUrl)GetSalesOrderMaterial"

    static let GetPurchaseOrderList = "\(baseUrl)GetPurchaseOrderList"
    static let GetSalesOrderList = "\(baseUrl)GetSalesOrderList"

    static let GetSupplierShipmentList = "\(baseUrl)GetSupplierShipmentList"




    static let GetPOGridNumberGridYear = "\(baseUrl)GetPOGridNumberGridYear"
    static let GetSoGridNumberGridYear = "\(baseUrl)GetSoGridNumberGridYear"
    static let GetShipmentBLNumberBLDate = "\(baseUrl)GetShipmentBLNumberBLDate"


    static let DeletePurchaseOrderMaterial = "\(baseUrl)DeletePurchaseOrderMaterial"


    static let GetCountryStateList = "\(baseUrl)GetCountryStateList"
    static let GetCountryStateCityList = "\(baseUrl)GetCountryStateCityList"
    static let GetEquipmentList = "\(baseUrl)GetEquipmentList"
    static let GetCountryPortList = "\(baseUrl)GetCountryPortList"
    static let GetCountryPortPlaceList = "\(baseUrl)GetCountryPortPlaceList"
    static let GetPaymentTermList = "\(baseUrl)GetPaymentTermList"
    static let GetSupplierList = "\(baseUrl)GetSupplierList"
    static let GetDeliveryTermList = "\(baseUrl)GetDeliveryTermList"

    static let AddDeliveryTerm = "\(baseUrl)AddDeliveryTerm"
    static let AddPaymentTerm = "\(baseUrl)AddPaymentTerm"
    static let AddPurchaseOrder = "\(baseUrl)AddPurchaseOrder"
    static let AddSalesOrder = "\(baseUrl)AddSalesOrder"
    static let GetPOMaterialList = "\(baseUrl)GetPOMaterialList"
    static let POSOMaterial = "\(baseUrl)POSOMaterial"
    static let AddSupplierShipment = "\(baseUrl)AddSupplierShipment"

    static let GetShippingLineList = "\(baseUrl)GetShippingLineList"
    static let GetSupplierShipmentPackingDetailList = "\(baseUrl)GetSupplierShipmentPackingDetailList"



    static let GetMaterialList = "\(baseUrl)GetMaterialList"
    static let GetPackagingTypeList = "\(baseUrl)GetPackagingTypeList"
    static let GetCurrencyList = "\(baseUrl)GetCurrencyList"

    static let AddPurchaseOrderMaterial = "\(baseUrl)AddPurchaseOrderMaterial"
    static let AddSalesOrderMaterial = "\(baseUrl)AddSalesOrderMaterial"
    static let DeleteSalesOrderMaterial = "\(baseUrl)DeleteSalesOrderMaterial"



}
func add(asChildViewController viewController: UIViewController, _ selfVC:UIViewController) {

    selfVC.addChild(viewController)
    selfVC.view.addSubview(viewController.view)
    viewController.view.frame = selfVC.view.bounds
    viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    viewController.didMove(toParent: selfVC)
}

class Constants {
    static let Status = "Flag"
    static let Code = "Code"
}
