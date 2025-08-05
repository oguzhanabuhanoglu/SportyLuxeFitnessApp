//
//  AddProfilePictureView.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 5.08.2025.
//

import UIKit

class AddProfilePictureView: UIView {
    
    
    // MARK: - Subviews
    private let titleLabel: MainLabel = {
        let label = MainLabel(text: "Fotoğraf Ekle",
                              font: .poppins(.medium(14)),
                              textColor: .disabledButton)
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "plusImage")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        addSubview(imageContainer)
        imageContainer.addSubview(imageView)
    }
    
    private func setupConstraints() {
        titleLabel.anchor(
            .top(anchor: topAnchor),
            .leading(anchor: leadingAnchor),
            .trailing(anchor: trailingAnchor),
            .height(.constant(20))
        )
        
        imageContainer.anchor(
            .top(anchor: titleLabel.bottomAnchor, padding: 4),
            .leading(anchor: leadingAnchor),
            .bottom(anchor: bottomAnchor)
        )
        
        imageView.anchor(
            .top(anchor: imageContainer.topAnchor),
            .leading(anchor: imageContainer.leadingAnchor),
            .width(.constant(120)),
            .height(.constant(136))
        )
    }
    
    
    
}
