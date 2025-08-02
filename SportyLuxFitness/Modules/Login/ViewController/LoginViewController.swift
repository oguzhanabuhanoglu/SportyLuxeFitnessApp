//
//  LoginViewController.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 2.08.2025.
//

import UIKit

class LoginViewController: ViewController<LoginView> {
    
    private let validation: ValidationService = ValidationService()

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.sendCodeButton.isActive = false
        setupActions()
        hideKeyboardWhenTappedAround()
    }
    
    
    //MARK: - Functions
    private func setupActions() {
        mainView.phoneNumberTextFieldComponent.textField.addAction(UIAction { [weak self] _ in
            if let _ = try? self?.validation.validatePhoneNumber(self?.mainView.phoneNumberTextFieldComponent.fieldValue) {
                self?.mainView.sendCodeButton.isActive = true
            } else {
                self?.mainView.sendCodeButton.isActive = false
            }
        }, for: .editingChanged)
        
        
        mainView.sendCodeButton.addAction(UIAction { [weak self] _ in
            self?.validateLoginInfo()

        }, for: .touchUpInside)
    }
    
    private func validateLoginInfo() {
        do {
            let phoneNumber = try validation.validatePhoneNumber(mainView.phoneNumberTextFieldComponent.fieldValue)
            print("Phone number", phoneNumber)
//            authorize(phoneNumber: phoneNumber)
            coordinator?.toVerificationVC()
        } catch {
            print("⚠️ gazaaaaaa")
//            mainView.phoneNumberTextFieldComponent.showError(error: error.localizedDescription)
        }
    }
    


    

}
