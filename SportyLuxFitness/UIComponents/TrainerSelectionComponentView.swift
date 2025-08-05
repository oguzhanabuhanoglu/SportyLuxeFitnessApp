//
//  TrainerSelectionComponentView.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 5.08.2025.
//

import UIKit

class TrainerSelectionComponentView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Eğitmen Seç"
        label.font = .poppins(.medium(14))
        label.textColor = .disabledButton
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private let containerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .clear
    }

    private func setupSubviews() {
        containerStack.addArrangedSubview(titleLabel)
        containerStack.addArrangedSubview(collectionView)
        addSubview(containerStack)
    }

    private func setupConstraints() {
        containerStack.fillToSuperview(.fullSpace())
//        collectionView.anchor(.height(.constant(140))) 
    }
}
