//
//  RegisterMemberView.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 5.08.2025.
//

import UIKit

class RegisterView: UIView {
    
    // MARK: SUBVIEWS
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var nameTFComponent: TextFieldComponentView = {
        let field = TextFieldComponentView(title: "Ad")
        field.textField.returnKeyType = .next
        field.textField.textContentType = .name
        field.textField.addAction(UIAction { [weak self] _ in
            self?.surnameTFComponent.textField.becomeFirstResponder()
        }, for: .editingDidEndOnExit)
        return field
    }()
    
    lazy var surnameTFComponent: TextFieldComponentView = {
        let field = TextFieldComponentView(title: "Soy Ad")
        field.textField.returnKeyType = .next
        field.textField.textContentType = .familyName
        field.textField.addAction(UIAction { [weak self] _ in
            self?.identityNumberTFComponent.textField.becomeFirstResponder()
        }, for: .editingDidEndOnExit)
        return field
    }()
    
    lazy var identityNumberTFComponent: TextFieldComponentView = {
        let field = TextFieldComponentView(title: "Kimlik Numarası")
        field.textField.returnKeyType = .next
        field.textField.keyboardType = .asciiCapableNumberPad
        field.textField.addAction(UIAction { [weak self] _ in
            self?.birthdayTFComponent.textField.becomeFirstResponder()
        }, for: .editingDidEndOnExit)
        return field
    }()
    
    lazy var birthdayTFComponent: TextFieldComponentView = {
        let field = TextFieldComponentView(title: "Doğum Tarihi")
        field.textField.returnKeyType = .next
        field.textField.inputView = datePicker
        field.textField.addAction(UIAction { [weak self] _ in
            self?.phoneNumberTFComponent.textField.becomeFirstResponder()
        }, for: .editingDidEndOnExit)
        field.textField.textAlignment = .center
        return field
    }()
    
    lazy var phoneNumberTFComponent: TextFieldComponentView = {
        let field = TextFieldComponentView(title: "Telefon Numarası")
        field.textField.returnKeyType = .done
        field.textField.keyboardType = .asciiCapableNumberPad
        return field
    }()
    
    lazy var membershipOptionsView: OptionsGroupView = {
        let view = OptionsGroupView(title: "Abonelik Paketi", options: ["Classic", "Gold"])
        return view
    }()
    
    lazy var membershipDurationView: OptionsGroupView = {
        let view = OptionsGroupView(title: "Abonelik Süresi", options: ["1 Ay","3 Ay","6 Ay","12 Ay"])
        return view
    }()
    
    lazy var membershipStartDateTFComponent: TextFieldComponentView = {
        let field = TextFieldComponentView(title: "Abonelik Başlangıcı")
        field.textField.returnKeyType = .next
        field.textField.inputView = datePicker
        field.textField.addAction(UIAction { [weak self] _ in
            self?.phoneNumberTFComponent.textField.becomeFirstResponder()
        }, for: .editingDidEndOnExit)
        field.textField.textAlignment = .center
        return field
    }()
    
    lazy var membershipEndDateLabel: MainLabel = {
        let label = MainLabel(text: "Abonelik Bitişi: ",
                              font: UIFont.poppins(.medium(14)),
                              textColor: .disabledButton)
        
        return label
    }()
    
    let trainerSelectionView = TrainerSelectionComponentView()
    
    lazy var measurementsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        let title = NSAttributedString(string: "Ölçümler", attributes: [.font: UIFont.poppins(.medium(14)), .foregroundColor : UIColor.primaryBlack])
        button.setAttributedTitle(title, for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
    
    // MARK: PT COMPONENTS
    lazy var addProfilePictureView = AddProfilePictureView()
    lazy var certificatesComponent = TextViewComponentView(title: "Sertifikalar")
    lazy var expertiseComponent = TextViewComponentView(title: "Uzmanlık Alanları")
    
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameTFComponent,
                                                   surnameTFComponent,
                                                   identityNumberTFComponent,
                                                   birthdayTFComponent,
                                                   phoneNumberTFComponent,
                                                   addProfilePictureView,
                                                   memberInfosVStack,
                                                   trainerInfosVStack])
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    lazy var memberInfosVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [membershipOptionsView,
                                                   membershipDurationView,
                                                   membershipStartDateTFComponent,
                                                   membershipEndDateLabel,
                                                   trainerSelectionView,
                                                   measurementsButton])
        stack.axis = .vertical
        stack.spacing = 16
        stack.setCustomSpacing(3, after: membershipStartDateTFComponent)
        return stack
    }()
    
    lazy var trainerInfosVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [certificatesComponent,
                                                   expertiseComponent])
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.maximumDate = Calendar.current.date(byAdding: .year, value: -18, to: Date())
        picker.addTarget(self, action: #selector(birthdayChanged), for: .valueChanged)
        return picker
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
    
    // MARK: Funcs
    @objc private func birthdayChanged() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        birthdayTFComponent.textField.text = formatter.string(from: datePicker.date)
    }
    
    
    private func setup() {
        backgroundColor = .appBackground
    }
    
    private func setupSubviews() {
        addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(mainVStackView)
    }
    
    private func layoutConstraints() {
        //ScrollView
        scrollView.fillToSuperview(.fullSpace())
        
        //ContentView
        contentView.anchor(.top(anchor: scrollView.topAnchor),
                           .bottom(anchor: scrollView.bottomAnchor),
                           .leading(anchor: scrollView.leadingAnchor),
                           .trailing(anchor: scrollView.trailingAnchor),
                           .width(.equalTo(scrollView.widthAnchor, multiplier: 1)))
        
        
        mainVStackView.fillToSuperview(.fullSpace(padding: .init(top: 16, left: 16, bottom: 40, right: 16)))

        trainerSelectionView.anchor(.height(.constant(150)))
        
        measurementsButton.anchor(.height(.constant(40)))
        
        addProfilePictureView.anchor(.height(.constant(160)))
        certificatesComponent.anchor(.height(.constant(110)))
        expertiseComponent.anchor(.height(.constant(110)))
        
       
    }

}
