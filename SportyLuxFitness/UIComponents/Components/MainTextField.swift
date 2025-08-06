//
//  MainTextField.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 2.08.2025.
//

import UIKit

enum MainTextFieldStyle {
    case empty, editing, filled/*, success, error, warning, disabled*/
}

class MainTextField: UITextField {

    var characterLimit = 0
    
    private var style: MainTextFieldStyle = .empty
    
    private var padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    
    var disableEditing: Bool = false
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    convenience init() {
        self.init(frame: .zero)
     
        self.delegate = self
        
        self.font = .poppins(.regular(14))
        
        self.layer.cornerRadius = 12
                
        self.tintColor = .black
        
        self.backgroundColor = .textfieldBackground
        
        configure(style: .empty)
                        
        addAction(UIAction { [weak self] _ in
            guard let self = self else {return}
            UIView.transition(with: self, duration: 0.2, options: [.transitionCrossDissolve, .curveEaseIn]) {
                self.configure(style: .editing)
            }
            
        }, for: .editingDidBegin)
        

        addAction(UIAction { [weak self] _ in
            guard let self = self else {return}
            self.textColor = .primaryBlack
            UIView.transition(with: self, duration: 0.2, options: [.transitionCrossDissolve, .curveEaseOut]) {
                self.configure(style: (self.text?.isEmpty ?? false) ? .empty : .filled)
            }

        }, for: .editingDidEnd)
    }

    var alwaysEditing: Bool = false
    func configure(style: MainTextFieldStyle) {
        self.style = style
        
        if alwaysEditing {
            self.style = .editing
        }
        
        backgroundColor = .textfieldBackground
        isUserInteractionEnabled = true
        
        switch self.style {
        case .empty:
            textColor = .black
            
        case .editing:
            textColor = .black
            
        case .filled:
            textColor = .black
            
//        case .success:
//            textColor = .primaryBlack
//            layer.borderColor = UIColor.successDefault.cgColor
//            
//        case .error:
//            textColor = .primaryBlack
//            layer.borderColor = UIColor.errorDefault.cgColor
//            
//        case .warning:
//            textColor = .primaryBlack
//            layer.borderColor = UIColor.warningDefault.cgColor
//            
//        case .disabled:
//            isUserInteractionEnabled = false
//            backgroundColor = UIColor.displayVariant20
//            textColor = .displayVariant40
//            layer.borderColor = UIColor.displayVariant40.cgColor
        }
    }
    
    
    func addSideIcon(with icon: UIImage) {
        let button = UIButton(type: .custom)
        button.setImage(icon, for: .normal)
        button.imageEdgeInsets = .init(top: 0, left: -25, bottom: 0, right: 0)
        button.tintColor = .primaryBlack
        rightView = button
        rightViewMode = .always
    }
    
    
    func addLeadingIcon(with icon: UIImage, iconTintColor: UIColor) {
        let iconImageView = UIImageView(image: icon)
        iconImageView.tintColor = iconTintColor
        iconImageView.contentMode = .center

        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: icon.size.width + 20, height: self.frame.height))
        
        iconImageView.frame = CGRect(x: 16, y: ( self.frame.height - icon.size.height) / 2, width: icon.size.width, height: icon.size.height)
        containerView.addSubview(iconImageView)

        leftView = containerView
        leftViewMode = .always
    }
    

}



extension MainTextField {
    func setPadding(left: CGFloat, right: CGFloat) {
        padding = UIEdgeInsets(top: 0, left: left, bottom: 0, right: right)
        setNeedsDisplay()
    }
}


extension MainTextField {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if (traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)) {
            configure(style: self.style)
        }
    }
}

extension MainTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if characterLimit != 0 {
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else {return false}
            let updateText = currentText.replacingCharacters(in: stringRange, with: string)
            
            return (updateText.count - 1) < characterLimit
        }
        
        return true
 
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if disableEditing {
            if action == #selector(paste(_:)) || action == #selector(cut) || action == #selector(delete) || action == #selector(select) || action == #selector(selectAll) {
                return false
            }
        }
        return super.canPerformAction(action, withSender: sender)
    }
    
}

