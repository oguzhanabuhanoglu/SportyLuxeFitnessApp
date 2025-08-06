//
//  ListCell.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 6.08.2025.
//

import UIKit

class ListCell: UICollectionViewCell {
    static let identifier = "ListCell"
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "personIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .appBackground
        imageView.layer.cornerRadius = 35
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.poppins(.medium(16))
        label.textColor = .primaryBlack
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.poppins(.medium(16))
        label.textColor = .secondaryText
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 12
        setupSubviews()
        layoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with trainer: Trainer) {
        nameLabel.text = trainer.name
        typeLabel.text = trainer.id
    }
    
    private func setupSubviews() {
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(typeLabel)
        
    }
    
    private func layoutConstraints() {

        
        profileImageView.anchor(.width(.constant(70)),
                                .height(.constant(70)),
                                .centerY(centerYAnchor, offset: 0),
                                .leading(anchor: leadingAnchor, padding: 8))
        
        nameLabel.anchor(.leading(anchor: profileImageView.trailingAnchor, padding: 6),
                         .top(anchor: topAnchor, padding: 16),
                         .height(.constant(20)))
        
        typeLabel.anchor(.leading(anchor: profileImageView.trailingAnchor, padding: 6),
                         .top(anchor: nameLabel.bottomAnchor, padding: 4),
                         .height(.constant(20)))
    }
}
