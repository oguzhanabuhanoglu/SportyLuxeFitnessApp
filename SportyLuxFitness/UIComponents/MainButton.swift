//
//  MainButton.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 1.08.2025.
//

import UIKit

enum MainButtonStyle: CaseIterable {
    case primary, secondary, disable, cancel
}

class MainButton: UIButton {

    //MARK: - Properties
    private var buttonTitle = String()
    
    private var buttonStyle: MainButtonStyle = .primary
    
    private var textColor: UIColor = .white
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.color = textColor
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    var style: MainButtonStyle = .primary {
        didSet {
            configureButton(with: style)
        }
    }
        
    
    var isActive: Bool = true {
        didSet {
            if isActive {
                if oldValue != isActive {
                    UIView.animate(withDuration: 0.25) {
                        self.configureButton(with: self.buttonStyle)
                    }
                }
            } else {
                if buttonStyle == .primary || buttonStyle == .secondary {
                    self.configureButton(with: .disable)
                }
            }
        }
    }
    

    //MARK: - Initilaztion
    convenience init(
        title: String,
        style: MainButtonStyle = .primary,
        font: UIFont = UIFont(name: "Poppins-SemiBold", size: 16) ?? .systemFont(ofSize: 16, weight: .semibold)
    ) {
    
        self.init(type: .custom)
        
        self.setTitle(title, for: .normal)
        
        self.titleLabel?.font = font
                
        self.layer.cornerRadius = 27.5
                
        self.buttonStyle = style
        
        self.buttonTitle = title
        
        self.configureButton(with: style)
       
    }
    
    //MARK: - Functions
    override func layoutSubviews() {
        super.layoutSubviews()
//        gradientLayer.frame = self.bounds
    }
    
    private func configureButton(with style: MainButtonStyle) {
        switch style {
        case .primary:
            backgroundColor = .primaryOrange
            textColor = .white
            isEnabled = true
            
        case .secondary:
            backgroundColor = .primaryBlack
            textColor = .white
            isEnabled = true
            
        case .disable:
            backgroundColor = .disabledButton
            textColor = .lightGray
            isEnabled = false
            
        case .cancel:
            backgroundColor = .white
            textColor = .primaryOrange
            layer.borderWidth = 1
            layer.borderColor = UIColor.primaryOrange.cgColor
            isEnabled = true
        }
        
        setTitleColor(textColor, for: .normal)
        setTitleColor(textColor.withAlphaComponent(0.3), for: .highlighted)
    }

}


extension MainButton {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if (traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)) {
            configureButton(with: buttonStyle)
        }
    }
}

