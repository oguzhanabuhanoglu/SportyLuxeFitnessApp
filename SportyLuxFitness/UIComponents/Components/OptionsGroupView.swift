//
//  OptionsGroupView.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 5.08.2025.
//

import UIKit

class OptionsGroupView: UIView {
    
    // MARK: - Properties
    private let titleLabel = UILabel()
    private let stackView = UIStackView()
    
    private var optionButtons: [UIButton] = []
    private var selectedButton: UIButton?
    
    var onSelectionChanged: ((String) -> Void)?
    
    // MARK: - Init
    init(title: String, options: [String]) {
        super.init(frame: .zero)
        setupViews()
        configure(title: title, options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupViews() {
        // Title label
        titleLabel.font = UIFont.poppins(.medium(14))
        titleLabel.textColor = .disabledButton
        
        // StackView
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        
        // Add subviews
        let container = UIStackView(arrangedSubviews: [titleLabel, stackView])
        container.axis = .vertical
        container.spacing = 8
        
        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configure(title: String, options: [String]) {
        titleLabel.text = title
        
        for option in options {
            let button = createOptionButton(with: option)
            optionButtons.append(button)
            stackView.addArrangedSubview(button)
        }
        
        // Default select first
        if let first = optionButtons.first {
            handleSelection(first)
        }
    }
    
    private func createOptionButton(with title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.poppins(.bold(14))
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.anchor(.height(.constant(48)))
        button.addTarget(self, action: #selector(didTapOption(_:)), for: .touchUpInside)
        updateStyle(button, selected: false)
        return button
    }
    
    // MARK: - Actions
    @objc private func didTapOption(_ sender: UIButton) {
        handleSelection(sender)
    }
    
    private func handleSelection(_ button: UIButton) {
        selectedButton.map { updateStyle($0, selected: false) }
        updateStyle(button, selected: true)
        selectedButton = button
        onSelectionChanged?(button.title(for: .normal) ?? "")
    }
    
    private func updateStyle(_ button: UIButton, selected: Bool) {
        if selected {
            button.backgroundColor = .primaryBlack
            button.setTitleColor(.white, for: .normal)
        } else {
            button.backgroundColor = .textfieldBackground
            button.setTitleColor(.lightGray, for: .normal)
        }
    }
}
