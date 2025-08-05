//
//  TrainerCell.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 4.08.2025.
//

import UIKit

class TrainerCell: UICollectionViewCell {
    
    static let identifier = "TrainerCell"
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .poppins(.bold(12))
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .clear
        label.clipsToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 12
        layer.masksToBounds = true  // Bu önemli, yoksa köşeler yemez
        
        contentView.clipsToBounds = true
        contentView.backgroundColor = .clear
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        
        imageView.fillToSuperview(.fullSpace())
        nameLabel.anchor(
            .leading(anchor: contentView.leadingAnchor, padding: 4),
            .trailing(anchor: contentView.trailingAnchor, padding: 4),
            .bottom(anchor: contentView.bottomAnchor, padding: 4),
            .height(.constant(24))
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with trainer: Trainer, isSelected: Bool) {
        imageView.image = trainer.image ?? UIImage(named: "empty")
        nameLabel.text = trainer.name
        
        // Sadece border burada ayarlanır
        if isSelected {
            layer.borderWidth = 2
            layer.borderColor = UIColor.primaryOrange.cgColor
        } else {
            layer.borderWidth = 0
            layer.borderColor = UIColor.clear.cgColor
        }
    }
    
}
