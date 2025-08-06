//
//  OTPTextField.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 3.08.2025.
//

import UIKit

protocol OTPTextFieldDelegate: AnyObject {
    func didFinishEnteringCode(code: String)
    func didChangeCode(code: String)
}

class OTPTextField: UITextField {
    
    //MARK: - Parameters
    weak var OTPDelegate: OTPTextFieldDelegate?
    
    private var defaultCharacter = ""
    
    private let slotCount: Int = 6
    
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
    }()
    
    //MARK: - Subviews
    private var slots = [OTPSlotView]()
    
    lazy var labelsHStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 16
        return stack
    }()
    
    
    //MARK: - Initialization
    init() {
        super.init(frame: .zero)
        setup()
        setupSubviews()
        layoutConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    private func setup() {
        delegate = self
        
        tintColor = .clear
        
        textColor = .clear
        
        keyboardType = .asciiCapableNumberPad
        
        textContentType = .oneTimeCode
        
        addAction(UIAction { [weak self] _ in
            self?.textDidChange()
        }, for: .editingChanged)
        
        addSubview(labelsHStackView)
        
        addGestureRecognizer(tapRecognizer)
    }
    
    private func setupSubviews() {
        for _ in 1 ... slotCount{
          let slot = OTPSlotView()
            
            slot.status = .empty
            labelsHStackView.addArrangedSubview(slot)
            
            slots.append(slot)
            
            slot.anchor(.width(.constant(40)))
        }
        
    }
    
    //MARK: - Constraint
    private func layoutConstraint() {
        labelsHStackView.fillToSuperview(.fullSpace())
        
    }
    
    //MARK: - Functions
    private func textDidChange() {
        guard let text = self.text, text.count <= slotCount else {return}
        
        for i in 0 ..< slotCount {
            let currentSlot = slots[i]
            
            if i < text.count {
                let index = text.index(text.startIndex, offsetBy: i)
                currentSlot.label.text = String(text[index])
                currentSlot.status = .filled
            }
            else {
                currentSlot.label.text = defaultCharacter
                currentSlot.status = .empty
            }
           
        }
        
        if text.count == slotCount {
            OTPDelegate?.didFinishEnteringCode(code: text)
        }
        
        OTPDelegate?.didChangeCode(code: text)

    }
    
}

extension OTPTextField : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let characterCount = textField.text?.count else {return false}
        return characterCount < slotCount || string == ""
    }

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(paste(_:)) || action == #selector(cut) || action == #selector(delete) || action == #selector(select) || action == #selector(selectAll) {
            return false
        }
        
        return super.canPerformAction(action, withSender: sender)
    }
}
