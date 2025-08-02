//
//  OnboardingView.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 1.08.2025.
//

import UIKit

class OnboardingView: UIView {
    
    
    init() {
        super.init(frame: .zero)
        setup()
        setupSubviews()
        layoutConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Setup
    private func setup() {
        backgroundColor = .appBackground
    }
    
    private func setupSubviews() {
       
        
    }
    
    //MARK: - Constraint
    private func layoutConstraints() {
        
    }
    
    
    
    
}
