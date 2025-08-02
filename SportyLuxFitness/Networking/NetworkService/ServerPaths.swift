//
//  ServerPaths.swift
//  NetworkService
//
//  Created by Oğuzhan Abuhanoğlu on 31.07.2025.
//

import Foundation

public enum ServerPaths: String {
        
    static let scheme = "https"

    static var host: String = "api.sportylux.com"
    
//    {
//        get {
//            switch UserDefaults.apiMode {
//            case .production:
//                return "api.eksperden.com"  
//            case .test:
//                return "testapi.eksperden.com"
//            case .dev:
//                return "devapi.eksperden.com"
//            }
//        }
//    }
    
    
    static var serverURL: URL {
        guard let url = URL(string: "\(ServerPaths.scheme)://\(ServerPaths.host)/") else {
            preconditionFailure("Invalid URL")
        }
        return url
    }
    
    //Home
    case home = "home/get"
   
    //Authorization
    case authorize = "auth/authorize"
    case codeVerification = "auth/codeVerification"
    case register = "auth/register"
    case expertRegistration = "auth/expertRegistration"
    case galleryRegistration = "auth/galleryRegistration"
    case refreshAccessToken = "auth/refreshToken"
    case appointmentAuthorization = "auth/appointment/authorize"
    case appointmentVerification = "auth/appointment/verification"
    case acceptInvitation = "auth/acceptInvitationWithoutRegister"
    
    
    //User
    case deleteUser = "user/delete"
    case userNotificationsSettings = "user/notificationSettings"
    case updateUserName = "user/updateName"
    case requestUpdatingEmailOrPhone = "user/sendVerificationCode"
    case updateEmailOrPhone = "user/updateEmailOrPhone"
    case canChangeName = "user/changeName"
    case verifyIdentity = "user/verifyIdentity"
    
    
    //Vehicle Options
    case options = "vehicle/options"
    case removeOption = "vehicle/removeOption"
    case addOption = "vehicle/addOption"
    case answerOptionType = "accountManager/answerOptionType"
    case enableOption = "vehicle/enableOption"
    
    
    //Vehicle
    case addVehicle = "vehicle/addVehicle"
    case additionalInformation = "vehicle/additionalInformation"
    case addVehicleReport = "vehicle/addReport"
    case addVehiclePhoto = "vehicle/addVehiclePhoto"
    case vehicleDetails = "vehicle/details"
    case deleteVehicle = "vehicle/delete"
    case getAllVehicles = "vehicle/getAll"
    case getSimilarVehicles = "vehicle/getSimilar"
    case publishVehicle = "vehicle/publish"
    case getReport = "vehicle/getReport"
    case makeSalesCancelledReport = "vehicle/makeSalesCancelledReport"
    case equipments = "vehicle/equipments"
    case addVehicleEquipments = "vehicle/addVehicleEquipment"
    case addEquipment = "vehicle/addEquipment"
    case enableEquipment = "vehicle/enableEquipment"
    case removeEquipment = "vehicle/removeEquipment"
    case addVehicleLicense = "vehicle/addVehicleLicense"
    case rejectAuction = "vehicle/reject"
    case nextWinnerAccept = "vehicle/nextWinnerAccept"
    
    
    //Addresses
    case addressesGet = "addresses/get"
    case addressesAddressDetails = "addresses/addressDetails"
    case addressesSetDefault = "addresses/setDefault"
    case addressesDelete = "addresses/delete"
    case addressesAdd = "addresses/add"
    case addressesCities = "addresses/cities"
    case addressesNeighborhoods = "addresses/neighborhoods"
    
    
    //Tickets
    case ticketsPackages = "tickets/packages"
    case ticketPurchased = "tickets/productPurchased"
    
    
    //Messaging
    case messagingRegister = "mesaging/register"
    
    
    //Auction
    case auctionPlaceOffer = "auction/placeOffer"
    case auctionPayServiceFee = "auction/payServiceFee"
    case auctionAnswerOffer = "auction/answerOffer"
    case auctionGetContactDetails = "auction/getContactDetails"
    
    
    //Admin
    case accountManagerCompanies = "accountManager/companies"
    case accountManagerApproveCompany = "accountManager/approveCompany"
    case accountManagerRejectCompany = "accountManager/rejectCompany"
    case accountManagerVehicles = "accountManager/vehicles"
    case accountManagerDeleteVehicle = "accountManager/deleteVehicle"
    case approveVehicle = "accountManager/approveVehicle"
    case rejectVehicle = "accountManager/rejectVehicle"
    case accountManagerGetUsers = "accountManager/users"
    case accountManagerUpdateUser = "accountManager/updateUser"
    case orderCancelationDetails = "admin/getsalesCancellationReport"
    case rightSideSalesRejection = "admin/rightSideSalesRejection"
    case cancelAuction = "accountManager/deleteAuction"
    case userInfo = "admin/getUserInformation"
    case companyInfo = "admin/getCompanyInformation"
    case updateUserRoel = "admin/updateRole"
    case attainAccountManager = "admin/attainAccountManager"
    case deleteAccountManager = "admin/deleteAccountManager"
    case allowNameChange = "admin/allowNameChange"
    
    
    //Company
    case getCompanyInfo = "company/getInfo"
    case deleteCompany = "company/delete"
    case getBranches = "company/getBranches"
    case deleteBranch = "company/deleteBranch"
    case getCompanyUsers = "company/getUsers"
    case deleteCompanyUser = "company/deleteUser"
    case companyUpdateInfo = "company/updateInfo"
    case galleryGetPreferredOptions = "gallery/getPreferredOptions"
    case galleryDeletePreferredOption = "gallery/deletePreferredOption"
    case galleryUpdatePreferredOptions = "gallery/updatePreferredVehiclesTypes"
    case gallerySpecificationPreference = "gallery/getSpecificationPreference"
    case updateGallerySpecificationPreference = "gallery/updateSpecificationPreference"
    case companyInvitationLink = "company/invite/generate"
    case cancellationFees = "gallery/getCancellationFeePreference"
    case cancellationFeePaymentData = "gallery/cancellationFeePaymentData"
    
    
    //Notifications
    case getNotifications = "notifications/get"
    case clearNotifications = "notifications/clear"
    
    
    //Notary
    case nearestNotaries = "addresses/nearnotaries"
    
    
    //Checkout
    case checkoutDataForServiceFee = "payment/serviceFeePaymentData"
    case checkoutDataForExpertAppointment = "expert/appointmentFeePaymentData"
    case payForAppointment = "vehicle/getAppointment"
    case payCancellationFee = "gallery/payCancellationFee"
 
    
    //Credit Cards
    case creditCardGet = "creditCard/get"
    case creditCardAdd = "creditCard/add"
    case creditCardSetDefault = "creditCard/setDefault"
    case creditCardDelete = "creditCard/delete"
    
    //Expert
    case expertGetAll = "expert/getAll"
    case expertGet = "expert/get"
    case expertRegisterUser = "expert/registerUser"
    case expertGetAppointments = "expert/appointments"
    case expertPayments = "expert/getAllExpertProgressPayment"
    case expertServiceFees = "expert/me/serviceFees"
    case updateServiceFees = "expert/updateServiceFee"
    
}
