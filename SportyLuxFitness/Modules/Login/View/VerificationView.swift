//
//  VerificationView.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 2.08.2025.
//

import UIKit

class VerificationView: UIView {
    
    private let titleLabel: MainLabel = {
        let label = MainLabel(text: "Kod Gönderildi!", font: .poppins(.bold(24)))
        label.textAlignment = .center
        return label
    }()
    
    lazy var codeTextField: OTPTextField = {
        let textField = OTPTextField()
        return textField
    }()
    
    let descriptionLabel: MainLabel = {
        let label = MainLabel(text: "Lütfen telefonunuza gelen 6 haneli kodu girin",
                              font: .poppins(.medium(14)),
                              textColor: .lightGray)
        return label
    }()
    
    let verificateButton: MainButton = {
        let button = MainButton(title: "Doğrula", style: .primary)
        return button
    }()
    
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, codeTextField, descriptionLabel, verificateButton])
        stack.axis = .vertical
        stack.spacing = 24
        stack.alignment = .center
        stack.setCustomSpacing(70, after: titleLabel)
        return stack
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
        addSubview(mainVStackView)
    }
    
    private func layoutConstraints() {
        mainVStackView.anchor(.top(anchor: safeAreaLayoutGuide.topAnchor, padding: 120),
                              .leading(anchor: leadingAnchor, padding: 24),
                              .trailing(anchor: trailingAnchor, padding: 24))
        
        codeTextField.anchor(.height(.constant(48)))
        
        verificateButton.anchor(.height(.constant(55)),
                                .leading(anchor: leadingAnchor, padding: 24),
                                .trailing(anchor: trailingAnchor, padding: 24))
    }
  

}
