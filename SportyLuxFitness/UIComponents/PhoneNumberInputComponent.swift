//
//  PhoneNumberInputComponent.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 5.08.2025.
//

import UIKit

class PhoneNumberInputComponent: UIView {
    
    public var fieldValue: String? {
        guard let phone = phoneTextField.text, !phone.isEmpty else { return nil }
        return selectedAreaCode + phone
    }
    
    var selectedAreaCode: String {
        areaCodeButton.title(for: .normal) ?? "+90"
    }
    
    private let areaCodes = ["+90", "+1", "+44", "+49", "+33", "+7"]
    
    private let titleLabel: MainLabel = {
        let label = MainLabel(text: "Telefon Numaran", font: .poppins(.medium(14)), textColor: .disabledButton)
        return label
    }()
    
    private let areaCodeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+90", for: .normal)
        button.setTitleColor(.primaryBlack, for: .normal)
        button.titleLabel?.font = .poppins(.medium(14))
        button.backgroundColor = .textfieldBackground
        button.layer.cornerRadius = 16
        button.showsMenuAsPrimaryAction = true
        return button
    }()
    
    let phoneTextField: MainTextField = {
        let field = MainTextField()
        field.placeholder = "500-000-0000"
        field.keyboardType = .numberPad
        field.backgroundColor = .textfieldBackground
        field.layer.cornerRadius = 16
        return field
    }()
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, hStackView])
        stack.spacing = 4
        stack.axis = .vertical
        return stack
    }()
    
    lazy var hStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [areaCodeButton, phoneTextField])
        stack.spacing = 12
        stack.axis = .horizontal
        return stack
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setup()
        setupMenu()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(mainVStackView)
        
        mainVStackView.translatesAutoresizingMaskIntoConstraints = false
        areaCodeButton.translatesAutoresizingMaskIntoConstraints = false
        mainVStackView.fillToSuperview(.fullSpace())
        
        areaCodeButton.anchor(.height(.constant(48)),
                              .width(.constant(100)))
        phoneTextField.anchor(.height(.constant(48)))

    }
    
    private func setupMenu() {
        let actions = areaCodes.map { code in
            UIAction(title: code) { [weak self] _ in
                self?.areaCodeButton.setTitle(code, for: .normal)
            }
        }
        
        let menu = UIMenu(title: "Alan Kodu Seç", options: .displayInline, children: actions)
        areaCodeButton.menu = menu
    }
}
