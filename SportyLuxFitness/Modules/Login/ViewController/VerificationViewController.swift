//
//  VerificationViewController.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 2.08.2025.
//

import UIKit

class VerificationViewController: ViewController<VerificationView> {
    
    var code: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.codeTextField.OTPDelegate = self
        hideKeyboardWhenTappedAround()
        mainView.verificateButton.isActive = false
        navigationItem.hidesBackButton = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mainView.codeTextField.becomeFirstResponder()
        
    }
    
    
    
    
}

extension VerificationViewController: OTPTextFieldDelegate {
    func didFinishEnteringCode(code: String) {
        self.code = code
    }
    
    func didChangeCode(code: String) {
        mainView.verificateButton.isActive = (code.count == 6)
    }
}
