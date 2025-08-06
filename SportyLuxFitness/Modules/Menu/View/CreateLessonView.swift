//
//  CreateLessonView.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 7.08.2025.
//

import UIKit

class CreateLessonView: UIView {
    
    // MARK: SUBVIEWS
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var lessonNameTFComponent: TextFieldComponentView = {
        let field = TextFieldComponentView(title: "Ders Adı:")
        field.textField.returnKeyType = .done
        return field
    }()
    
    let trainerSelectionView = TrainerSelectionComponentView()
    
    lazy var externalTrainerTFComponent: TextFieldComponentView = {
        let field = TextFieldComponentView(title: "veya Eğitmen Gir:")
        field.textField.returnKeyType = .next
        field.textField.addAction(UIAction { [weak self] _ in
            self?.lessonDateTFComponent.textField.becomeFirstResponder()
        }, for: .editingDidEndOnExit)
        return field
    }()
    
    lazy var lessonDateTFComponent: TextFieldComponentView = {
        let field = TextFieldComponentView(title: "Ders Tarihi:")
        field.textField.returnKeyType = .next
        field.textField.inputView = datePicker
        field.textField.addAction(UIAction { [weak self] _ in
            self?.classNameTFComponent.textField.becomeFirstResponder()
        }, for: .editingDidEndOnExit)
        return field
    }()
    
    lazy var classNameTFComponent: TextFieldComponentView = {
        let field = TextFieldComponentView(title: "Sınıf Adı:")
        field.textField.returnKeyType = .next
        field.textField.addAction(UIAction { [weak self] _ in
            self?.capacityTFComponent.textField.becomeFirstResponder()
        }, for: .editingDidEndOnExit)
        return field
    }()
    
    lazy var capacityTFComponent: TextFieldComponentView = {
        let field = TextFieldComponentView(title: "Ders Kontenjanı:")
        field.textField.keyboardType = .numberPad
        field.textField.returnKeyType = .done
        return field
    }()
    
    let addlessonPictureSection = AddPictureView()
    
    lazy var lessonDescriptionComponent: TextViewComponentView = {
        let view = TextViewComponentView(title: "Ders Hakkında:")
        return view
    }()
    
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [lessonNameTFComponent,
                                                   trainerSelectionView,
                                                   externalTrainerTFComponent,
                                                   lessonDateTFComponent,
                                                   classNameTFComponent,
                                                   capacityTFComponent,
                                                   addlessonPictureSection,
                                                   lessonDescriptionComponent])
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        return picker
    }()

    init() {
        super.init(frame: .zero)
        setup()
        setupSubviews()
        layoutConstraits()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Funcs
    private func setup() {
        backgroundColor = .appBackground
    }
    
    private func setupSubviews() {
        addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(mainVStackView)
    }
    
    private func layoutConstraits() {
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
        addlessonPictureSection.anchor(.height(.constant(160)))
        lessonDescriptionComponent.anchor(.height(.constant(170)))
    }
    
    @objc private func dateChanged() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        lessonDateTFComponent.textField.text = formatter.string(from: datePicker.date)
    }

}
