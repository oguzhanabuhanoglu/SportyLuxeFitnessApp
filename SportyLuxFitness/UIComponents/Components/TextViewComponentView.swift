//
//  TextViewComponentView.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 5.08.2025.
//

import UIKit

class TextViewComponentView: UIView {
    
    // MARK: - Subviews
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.poppins(.medium(14))
        label.textColor = .disabledButton
        return label
    }()
    
    let textView: UITextView = {
        let view = UITextView()
        view.font = UIFont.poppins(.regular(14))
        view.textColor = .primaryBlack
        view.backgroundColor = .textfieldBackground
        view.layer.cornerRadius = 12
        view.textContainerInset = UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)
        view.isScrollEnabled = false
        return view
    }()
    
    // MARK: - Init
    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        setup()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setup() {
        backgroundColor = .clear
    }
    
    private func setupSubviews() {
        addSubview(titleLabel)
        addSubview(textView)
    }
    
    private func setupConstraints() {
        titleLabel.anchor(
            .top(anchor: topAnchor),
            .leading(anchor: leadingAnchor),
            .trailing(anchor: trailingAnchor),
            .height(.constant(20))
        )
        
        textView.anchor(
            .top(anchor: titleLabel.bottomAnchor, padding: 4),
            .leading(anchor: leadingAnchor),
            .trailing(anchor: trailingAnchor),
            .bottom(anchor: bottomAnchor),
            .height(.constant(80))
        )
    }
}
