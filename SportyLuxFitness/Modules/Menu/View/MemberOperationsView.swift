//
//  MemberOperationsView.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 5.08.2025.
//

import UIKit

class MemberOperationsView: UIView {
    
    let plusButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(.plusIcon, for: .normal)
        return button
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
       
    }
    
    private func layoutConstraints() {

    }

}
