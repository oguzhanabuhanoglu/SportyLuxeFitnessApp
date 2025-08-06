//
//  TextFieldComponentView.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 2.08.2025.
//

import UIKit

class TextFieldComponentView: UIView {
    
    //MARK: - Properties
    private let title: String
    
    public var fieldValue: String? {
        textField.text
    }
    
    var isRequired: Bool = false {
        didSet {
            updateTitle()
        }
    }
    
    //MARK: - Subviews
    lazy var titleLabel: MainLabel = {
        let label = MainLabel(text: title,
                            font: .poppins(.medium(14)),
                            textColor: .disabledButton)
        label.numberOfLines = 0
        return label
    }()
    
    let textField: MainTextField = {
        let textField = MainTextField()
        return textField
    }()
    
//    let noteLabel: EALabel = {
//        let label = EALabel(text: nil,
//                            font: .poppins(.medium(14)),
//                            textColor: .displayVariant40)
//        return label
//    }()
//
//    let noteImageView: UIImageView = {
//        let imageView = UIImageView(image: .warningMark)
//        imageView.tintColor = .errorDefault
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//    }()
//    
//    lazy var noteHStackView: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [noteImageView, noteLabel])
//        stack.axis = .horizontal
//        stack.spacing = 10
//        stack.alignment = .center
//        stack.isHidden = true
//        stack.alpha = 0
//        return stack
//    }()
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel,
                                                   textField,
                                                   /*noteHStackView*/])
        stack.axis = .vertical
        stack.spacing = 4
        stack.setCustomSpacing(6, after: textField)
        return stack
    }()

    //MARK: - Initialization
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        setup()
        setupSubviews()
        layoutConstraint()
        updateTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    private func setup() {
        backgroundColor = .clear
    }
    
    private func setupSubviews() {
        addSubview(mainVStackView)
        
//        textField.addAction(UIAction { [weak self] _ in
//            UIView.animate(withDuration: 0.5) {
//                self?.noteHStackView.isHiddenInStackView = true
//                self?.noteHStackView.alpha = 0
//            }
//        }, for: .editingDidBegin)
    }
    
    //MARK: - Constraint
    private func layoutConstraint() {
        mainVStackView.fillToSuperview(.fullSpace())
        
        textField.anchor(.height(.constant(48)))
        
//        noteImageView.anchor(.height(.constant(20)),
//                             .width(.constant(20)))
    }
    
    //MARK: - Functions
//    func showError(error message: String) {
//        textField.configure(style: .error)
//        textField.shake()
//        
//        noteLabel.text = message
//        noteLabel.textColor = .systemRed
//        UIView.animate(withDuration: 0.5) {
//            self.noteHStackView.isHiddenInStackView = false
//            self.noteHStackView.alpha = 1
//        }
//    }
    
    private func updateTitle() {
        if isRequired {
            let titleText = "\(title) *"
            let attributed = NSMutableAttributedString(string: titleText,
                                                       attributes: [
                                                        .foregroundColor: UIColor.disabledButton,
                                                        .font: UIFont.poppins(.medium(14))
                                                       ])
            if let range = titleText.range(of: "*") {
                let nsRange = NSRange(range, in: titleText)
                attributed.addAttribute(.foregroundColor, value: UIColor.systemRed, range: nsRange)
            }
            titleLabel.attributedText = attributed
        } else {
            titleLabel.text = title
            titleLabel.textColor = UIColor.disabledButton
            titleLabel.font = UIFont.poppins(.medium(14))
        }
    }

    
}

