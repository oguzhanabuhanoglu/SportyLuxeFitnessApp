//
//  OTPSlotView.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 3.08.2025.
//

import UIKit

class OTPSlotView: UIView {
    enum Status {
        case empty, filled
    }
    
    //MARK: - Properties
    var status: Status = .empty {
        didSet {
            guard oldValue != status else {return}
            UIView.animate(withDuration: 0.25) {
                self.updateViewStatus()
            }
        }
    }
    
    //MARK: - Subviews
    let label: MainLabel = {
        let label = MainLabel(text: nil,
                              font: .poppins(.regular(25)),
                              textColor: .white)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.textfieldBackground.cgColor, UIColor.textfieldBackground.cgColor]
//        layer.startPoint = CGPoint(x: 0.0, y: 0.5)
//        layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        return layer
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
        layer.cornerRadius = 12
        
        layer.masksToBounds = true
                                
        layer.addSublayer(gradientLayer)
        
        isUserInteractionEnabled = true
    }
    
    private func setupSubviews() {
        addSubview(label)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        
    }
    
    //MARK: - Constraint
    private func layoutConstraint() {
        label.fillToSuperview(.fullSpace())
        
    }
    
    //MARK: - Functions
    private func updateViewStatus() {
        switch status {
        case .empty:
            gradientLayer.colors = [UIColor.textfieldBackground.cgColor, UIColor.textfieldBackground.cgColor]
            
        case .filled:
            gradientLayer.colors = [UIColor.primaryOrange.cgColor, UIColor.primaryOrange.cgColor]
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if (traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)) {
            updateViewStatus()
        }
    }
}

