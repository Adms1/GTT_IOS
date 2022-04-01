//
//  Models.swift
//  GTT
//
//  Created by ADMS on 24/02/22.
//

import Foundation


struct countryModel {
    var CountryName:String
    var CountryID:Int

    init(countryName:String,countryID:Int) {
        self.CountryID = countryID
        self.CountryName = countryName
    }
}

struct shipLineModel {
    var Shippinglinename:String
    var Shippinglineid:Int

    init(Shippinglinename:String,Shippinglineid:Int) {
        self.Shippinglineid = Shippinglineid
        self.Shippinglinename = Shippinglinename
    }
}


struct stateModel {

    var countryStateID:Int
    var StateName:String

    init(stateName:String,cStateID:Int) {
        self.StateName = stateName
        self.countryStateID = cStateID
    }

}

struct cityModel {

    var countryStateCityID:Int
    var CityName:String

    init(cityName:String,cStateCityID:Int) {
        self.CityName = cityName
        self.countryStateCityID = cStateCityID
    }

}
struct equipmentModel {

    var EquipmentTypeID:Int
    var Equipmenttypename:String

    init(equipmentTypeID:Int,equipmenttypename:String) {
        self.EquipmentTypeID = equipmentTypeID
        self.Equipmenttypename = equipmenttypename
    }

}
struct supplierModel {

    var SupplierID:Int
    var SupplierName:String

    init(supplierID:Int,supplierName:String) {
        self.SupplierID = supplierID
        self.SupplierName = supplierName
    }

}
struct portModel {
    var countryID:Int
    var PortName:String

    init(CountryID:Int,portName:String) {
        self.countryID = CountryID
        self.PortName = portName
    }
}

struct findPlacePortModel1 {

    var CountryPortPlaceID:Int
    var countryPortID:Int
    var PlaceName:String

    init(CountryPortPlaceID:Int,countryPortID:Int,PlaceName:String) {
        self.CountryPortPlaceID = CountryPortPlaceID
        self.countryPortID = countryPortID
        self.PlaceName = PlaceName
    }

}

struct findPlacePortModel {

    var CountryPortID:Int
    var countryID:Int
    var PortName:String

    init(countryPortID:Int,countryID:Int,PortName:String) {
        self.CountryPortID = countryPortID
        self.countryID = countryID
        self.PortName = PortName
    }

}

struct portPlaceListModel {
    var countryPortID:Int
    var PlaceName:String

    init(countryPortID:Int,PlaceName:String) {
        self.countryPortID = countryPortID
        self.PlaceName = PlaceName
    }
}

struct paymentTermModel {
    var PaymentTermID:Int
    var PaymentTermName:String

    init(paymentTermID:Int,paymentTermName:String) {
        self.PaymentTermID = paymentTermID
        self.PaymentTermName = paymentTermName
    }
}

struct delivaryTermModel {
    var DeliveryTermID:Int
    var DeliveryName:String

    init(deliveryTermID:Int,deliveryName:String) {
        self.DeliveryTermID = deliveryTermID
        self.DeliveryName = deliveryName
    }
}

struct salesPurchaseModel {
    var title:String
   // var isExpand:Bool
    var arrSale:[saleOrderMatrialModel]
    var arrPurchase:[purchaseOrderMatrialModel]

    init(title:String,arrSale:[saleOrderMatrialModel],arrPurchase:[purchaseOrderMatrialModel]) {
        self.title = title
        self.arrPurchase = arrPurchase
        self.arrSale = arrSale
    }
}

struct ShipmentListModel {

//    var blno:String
//    var bldate:String
//    var vesselName:String
//    var suppliername:String
//    var shippinglinename:String
//
//    init(blno:String,bldate:String,vesselName:String,suppliername:String,shippinglinename:String)
//    {
//        self.blno = blno
//        self.bldate = bldate
//        self.vesselName = vesselName
//        self.suppliername = suppliername
//        self.shippinglinename = shippinglinename
//    }


    var suppliershipmentid:String
    var blno:String
    var bldate:String
    var vesselName:String
    var suppliername:String
    var shippinglinename:String
    var supplierid:String
    var shippinglineid:String
    var originalplaceofloadingid:String
    var portofloadingid:String
    var countryofloadingid:String
    var countryofdeliveryid:String
    var portofdischargeid:String
    var finalplaceofdeliveryid:String

    var countryofloading:String
    var countryofdelivery:String
    var portofloading:String
    var portofdischarge:String
    var finalplaceOfdelivery:String
    var originplaceofreceipt:String


    init(suppliershipmentid:String,blno:String,bldate:String,vesselName:String,suppliername:String,shippinglinename:String,supplierid:String,shippinglineid:String,originalplaceofloadingid:String,portofloadingid:String,countryofloadingid:String,countryofdeliveryid:String,portofdischargeid:String,finalplaceofdeliveryid:String,countryofloading:String,countryofdelivery:String,portofloading:String,portofdischarge:String,finalplaceOfdelivery:String,originplaceofreceipt:String)
    {
        self.suppliershipmentid = suppliershipmentid
        self.blno = blno
        self.bldate = bldate
        self.vesselName = vesselName
        self.suppliername = suppliername
        self.shippinglinename = shippinglinename
        self.supplierid = supplierid
        self.shippinglineid = shippinglineid
        self.originalplaceofloadingid = originalplaceofloadingid
        self.portofloadingid = portofloadingid
        self.countryofloadingid = countryofloadingid
        self.countryofdeliveryid = countryofdeliveryid
        self.portofdischargeid = portofdischargeid
        self.finalplaceofdeliveryid = finalplaceofdeliveryid

        self.countryofloading = countryofloading
        self.countryofdelivery = countryofdelivery
        self.portofloading = portofloading
        self.portofdischarge = portofdischarge
        self.finalplaceOfdelivery = finalplaceOfdelivery
        self.originplaceofreceipt = originplaceofreceipt


    }
}


struct supplierShipmentModel {

    var ContainerNumber:String
    var CreateDate:String
    var GrossWeight:String
    var IsActive:String
    var NetWeight:String
    var SealNumber:String
    var SupplierShipmentID:String
    var SupplierShipmentPackingDetailID:String

    init(ContainerNumber:String,CreateDate:String,GrossWeight:String,IsActive:String,NetWeight:String,SealNumber:String,SupplierShipmentID:String,SupplierShipmentPackingDetailID:String)
    {
        self.ContainerNumber = ContainerNumber
        self.CreateDate = CreateDate
        self.GrossWeight = GrossWeight
        self.IsActive = IsActive
        self.NetWeight = NetWeight
        self.SealNumber = SealNumber
        self.SupplierShipmentID = SupplierShipmentID
        self.SupplierShipmentPackingDetailID = SupplierShipmentPackingDetailID
    }
}


struct purchaseOrderMatrialModel
{
    var purchaseordermaterialid:Int
    var ContractQuantity:String
    var RatePerMt:String
    var AverageLoading:String
    var CurrencyAbbr:String
    var PackagingTypename:String
    var MaterialName:String
    var MaterialID:Int
    var CurrencyID:Int
    var PackagingTypeID:Int
    var SupplierName:String
    var AvailableQunatity:String
    var CurrencyNamme:String
    var PODate:String
    var QtyReceivedInShipment:String
    var SupplierShipmentPurchaseorderMaterialID:String


    init(purchaseordermaterialid:Int,ContractQuantity:String,RatePerMt:String,AverageLoading:String,CurrencyAbbr:String,PackagingTypename:String,MaterialName:String,MaterialID:Int,CurrencyID:Int,PackagingTypeID:Int,SupplierName:String,AvailableQunatity:String,CurrencyNamme:String,PODate:String,QtyReceivedInShipment:String,SupplierShipmentPurchaseorderMaterialID:String)
    {
        self.purchaseordermaterialid = purchaseordermaterialid
        self.ContractQuantity = ContractQuantity
        self.RatePerMt = RatePerMt
        self.AverageLoading = AverageLoading
        self.CurrencyAbbr = CurrencyAbbr
        self.PackagingTypename = PackagingTypename
        self.MaterialName = MaterialName
        self.MaterialID = MaterialID
        self.CurrencyID = CurrencyID
        self.PackagingTypeID = PackagingTypeID
        self.SupplierName = SupplierName
        self.AvailableQunatity = AvailableQunatity
        self.CurrencyNamme = CurrencyNamme
        self.PODate=PODate
        self.QtyReceivedInShipment=QtyReceivedInShipment
        self.SupplierShipmentPurchaseorderMaterialID=SupplierShipmentPurchaseorderMaterialID

    }
}

struct saleOrderMatrialModel {
    var SalesOrderMaterialID:Int
    var SalesOrderID:Int
    var ContractQuantity:String
    var RatePerMT:String
    var AverageLoading:String
    var CurrencyAbbr:String
    var PackagingTypename:String
    var MaterialName:String
    var MaterialID:Int
    var CurrencyID:Int
    var PackagingTypeID:Int
    var SupplierName:String
    var CurrencyName:String


    init(SalesOrderMaterialID:Int,ContractQuantity:String,RatePerMT:String,AverageLoading:String,CurrencyAbbr:String,PackagingTypename:String,MaterialName:String,MaterialID:Int,CurrencyID:Int,PackagingTypeID:Int,SalesOrderID:Int,SupplierName:String,CurrencyName:String)
    {
        self.SalesOrderMaterialID = SalesOrderMaterialID
        self.SalesOrderID = SalesOrderID
        self.ContractQuantity = ContractQuantity
        self.RatePerMT = RatePerMT
        self.AverageLoading = AverageLoading
        self.CurrencyAbbr = CurrencyAbbr
        self.PackagingTypename = PackagingTypename
        self.MaterialName = MaterialName
        self.MaterialID = MaterialID
        self.CurrencyID = CurrencyID
        self.PackagingTypeID = PackagingTypeID
        self.SupplierName = SupplierName
        self.CurrencyName = CurrencyName

    }
}

struct CurrencyModel {
    var CurrencyID:Int
    var CurrencyName:String

    init(CurrencyID:Int,CurrencyName:String) {
        self.CurrencyID = CurrencyID
        self.CurrencyName = CurrencyName
    }
}

struct PackagingModel {
    var PackagingTypeID:Int
    var PackagingTypeName:String

    init(PackagingTypeID:Int,PackagingTypeName:String) {
        self.PackagingTypeID = PackagingTypeID
        self.PackagingTypeName = PackagingTypeName
    }
}

struct MaterialModel {
    var MaterialID:Int
    var MaterialName:String
    var HSNCode:String

    init(MaterialID:Int,MaterialName:String,HSNCode:String) {
        self.MaterialID = MaterialID
        self.MaterialName = MaterialName
        self.HSNCode = HSNCode

    }
}

struct purchaseOrderListModel {
    var PurchaseOrderID:String
    var GridNumber:String
    var GridYear:String
    var SupplierContractID:String
    var Tolerance:String
    var SupplierName:String
    var EquipmentTypeName:String
    var CountryOfOrigin:String
    var PortOfLoading:String
    var PortOfDischarge:String
    var FinalPlaceOfDelivery:String
    var PaymentTerm:String
    var DeliveryTerm:String
    var CountryOfDischarge:String
    var SupplierID:Int
    var EnquipmentTypeID:Int
    var CountryOfOriginID:Int
    var PortOfLoadingID:Int
    var PortOfDischargeID:Int
    var FinalPlaceOfDeliveryID:Int
    var PaymentTermID:Int
    var DeliveryTermID:Int
    var CountryOfDischargeID:Int
    var EquipmentCount:Int

    init(PurchaseOrderID:String,GridNumber:String,GridYear:String,SupplierContractID:String,Tolerance:String,SupplierName:String,EquipmentTypeName:String,CountryOfOrigin:String,PortOfLoading:String,PortOfDischarge:String,FinalPlaceOfDelivery:String,PaymentTerm:String,DeliveryTerm:String,CountryOfDischarge:String,SupplierID:Int,EnquipmentTypeID:Int,CountryOfOriginID:Int,PortOfLoadingID:Int,PortOfDischargeID:Int,FinalPlaceOfDeliveryID:Int,PaymentTermID:Int,DeliveryTermID:Int,CountryOfDischargeID:Int,EquipmentCount:Int) {
        self.PurchaseOrderID = PurchaseOrderID
        self.GridNumber = GridNumber
        self.GridYear = GridYear
        self.SupplierContractID = SupplierContractID
        self.Tolerance = Tolerance
        self.SupplierName = SupplierName
        self.EquipmentTypeName = EquipmentTypeName
        self.CountryOfOrigin = CountryOfOrigin
        self.PortOfLoading = PortOfLoading
        self.PortOfDischarge = PortOfDischarge
        self.FinalPlaceOfDelivery = FinalPlaceOfDelivery
        self.PaymentTerm = PaymentTerm
        self.DeliveryTerm = DeliveryTerm
        self.CountryOfDischarge = CountryOfDischarge

        self.SupplierID = SupplierID
        self.EnquipmentTypeID = EnquipmentTypeID
        self.CountryOfOriginID = CountryOfOriginID
        self.PortOfLoadingID = PortOfLoadingID
        self.PortOfDischargeID = PortOfDischargeID
        self.FinalPlaceOfDeliveryID = FinalPlaceOfDeliveryID
        self.PaymentTermID = PaymentTermID
        self.DeliveryTermID = DeliveryTermID
        self.CountryOfDischargeID = CountryOfDischargeID
        self.EquipmentCount = EquipmentCount

    }    

}
struct shipmentDetailModel {

    var suppliershipmentid:String
    var blno:String
    var bldate:String
    var vesselName:String
    var suppliername:String
    var shippinglinename:String
    var supplierid:String
    var shippinglineid:String
    var originalplaceofloadingid:Int
    var portofloadingid:String
    var countryofloadingid:String
    var countryofdeliveryid:String
    var portofdischargeid:String
    var finalplaceofdeliveryid:String

    init(suppliershipmentid:String,blno:String,bldate:String,vesselName:String,suppliername:String,shippinglinename:String,supplierid:String,shippinglineid:String,originalplaceofloadingid:Int,portofloadingid:String,countryofloadingid:String,countryofdeliveryid:String,portofdischargeid:String,finalplaceofdeliveryid:String)
    {
        self.suppliershipmentid = suppliershipmentid
        self.blno = blno
        self.bldate = bldate
        self.vesselName = vesselName
        self.suppliername = suppliername
        self.shippinglinename = shippinglinename
        self.supplierid = supplierid
        self.shippinglineid = shippinglineid
        self.originalplaceofloadingid = originalplaceofloadingid
        self.portofloadingid = portofloadingid
        self.countryofloadingid = countryofloadingid
        self.countryofdeliveryid = countryofdeliveryid
        self.portofdischargeid = portofdischargeid
        self.finalplaceofdeliveryid = finalplaceofdeliveryid

    }
}


struct saleOrderListModel {
    var SalesOrderID:String
    var GridNumber:String
    var GridYear:String
    var BuyerContractID:String
    var Tolerance:String
    var SupplierName:String
    var EquipmentTypeName:String
    var CountryOfOrigin:String
    var PortOfLoading:String
    var PortOfDischarge:String
    var FinalPlaceOfDelivery:String
    var PaymentTerm:String
    var DeliveryTerm:String
    var CountryOfDischarge:String
    var BuyerID:Int
    var EquipmentTypeID:Int
    var CountryOfOriginID:Int
    var PortOfLoadingID:Int
    var PortOfDischargeID:Int
    var FinalPlaceOfDeliveryID:Int
    var PaymentTermID:Int
    var DeliveryTermID:Int
    var CountryOfDischargeID:Int
    var EquipmentCount:Int
    var UserID:Int
    var AdvanceType:Int
    var AdvanceAmount:Int


    init(SalesOrderID:String,GridNumber:String,GridYear:String,BuyerContractID:String,Tolerance:String,SupplierName:String,EquipmentTypeName:String,CountryOfOrigin:String,PortOfLoading:String,PortOfDischarge:String,FinalPlaceOfDelivery:String,PaymentTerm:String,DeliveryTerm:String,CountryOfDischarge:String,BuyerID:Int,EquipmentTypeID:Int,CountryOfOriginID:Int,PortOfLoadingID:Int,PortOfDischargeID:Int,FinalPlaceOfDeliveryID:Int,PaymentTermID:Int,DeliveryTermID:Int,CountryOfDischargeID:Int,EquipmentCount:Int,UserID:Int,AdvanceType:Int,AdvanceAmount:Int) {
        self.SalesOrderID = SalesOrderID
        self.GridNumber = GridNumber
        self.GridYear = GridYear
        self.BuyerContractID = BuyerContractID
        self.Tolerance = Tolerance
        self.SupplierName = SupplierName
        self.EquipmentTypeName = EquipmentTypeName
        self.CountryOfOrigin = CountryOfOrigin
        self.PortOfLoading = PortOfLoading
        self.PortOfDischarge = PortOfDischarge
        self.FinalPlaceOfDelivery = FinalPlaceOfDelivery
        self.PaymentTerm = PaymentTerm
        self.DeliveryTerm = DeliveryTerm
        self.CountryOfDischarge = CountryOfDischarge
        self.BuyerID = BuyerID
        self.EquipmentTypeID = EquipmentTypeID
        self.CountryOfOriginID = CountryOfOriginID
        self.PortOfLoadingID = PortOfLoadingID
        self.PortOfDischargeID = PortOfDischargeID
        self.FinalPlaceOfDeliveryID = FinalPlaceOfDeliveryID
        self.PaymentTermID = PaymentTermID
        self.DeliveryTermID = DeliveryTermID
        self.CountryOfDischargeID = CountryOfDischargeID
        self.EquipmentCount = EquipmentCount
        self.UserID = UserID
        self.AdvanceType = AdvanceType
        self.AdvanceAmount = AdvanceAmount

    }

}

