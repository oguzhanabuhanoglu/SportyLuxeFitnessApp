//
//  LoginView.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 2.08.2025.
//

import UIKit

class LoginView: UIView {
    
    private let titleLabel: MainLabel = {
        let label = MainLabel(text: "Hoş Geldin!", font: .poppins(.extraBold(24)))
        label.textAlignment = .center
        return label
    }()
    
    let phoneNumberTextFieldComponent: TextFieldComponentView = {
        let field = TextFieldComponentView(title: "Telefon Numaran")
        field.textField.keyboardType = .asciiCapableNumberPad
        field.textField.characterLimit = 10
        return field
    }()
    
    let sendCodeButton: MainButton = {
        let button = MainButton(title: "Kod Gönder", style: .primary, font: .poppins(.bold(16)))
        return button
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LOGO")
        return imageView
    }()
    
    
    init() {
        super.init(frame: .zero)
        setup()
        setupSubviews()
        layoutConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        backgroundColor = .appBackground
    }
    
    private func setupSubviews() {
        addSubview(titleLabel)
        addSubview(phoneNumberTextFieldComponent)
        addSubview(sendCodeButton)
        addSubview(logoImageView)
    }
    
    //MARK: - Constraint
    private func layoutConstraints() {
        phoneNumberTextFieldComponent.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.anchor(
            .top(anchor: topAnchor, padding: 230),
            .centerX(centerXAnchor),
            .width(.equalTo(widthAnchor, multiplier: 1))
        )
        
        phoneNumberTextFieldComponent.anchor(
            .top(anchor: titleLabel.bottomAnchor, padding: 70),
            .leading(anchor: leadingAnchor, padding: 24),
            .trailing(anchor: trailingAnchor, padding: 24),
            .height(.constant(70))
        )
        
        sendCodeButton.anchor(
            .top(anchor: phoneNumberTextFieldComponent.bottomAnchor, padding: 10),
            .leading(anchor: leadingAnchor, padding: 24),
            .trailing(anchor: trailingAnchor, padding: 24),
            .height(.constant(55))
        )
        
        logoImageView.anchor(
            .bottom(anchor: safeAreaLayoutGuide.bottomAnchor, padding: 70),
            .centerX(centerXAnchor),
            .width(.equalTo(widthAnchor, multiplier: 0.6)),
            .height(.constant(64))
            
            
        )
        
    }
    
    
}
