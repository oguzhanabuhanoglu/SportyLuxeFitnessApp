//
//  HomeView.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 1.08.2025.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - Subviews
    let navBar: UIView = {
        let view = UIView()
        view.backgroundColor = .appBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let profileImageView: UIImageView = {
        let imageView = UIImageView(image: .personIcon)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Selam Oğuz!"
        label.font = UIFont.poppins(.medium(16))
        label.textColor = .primaryBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let bellButton: UIButton = {
        let button = UIButton()
        button.setImage(.notificationIcon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(.menuIcon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var leftStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [profileImageView, nameLabel])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var rightStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [bellButton, menuButton])
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .primaryOrange
        collectionView.register(CalendarCell.self, forCellWithReuseIdentifier: CalendarCell.identifier)
        collectionView.register(BusynessCell.self, forCellWithReuseIdentifier: BusynessCell.identifier)
        collectionView.register(ProgramCell.self, forCellWithReuseIdentifier: ProgramCell.identifier)
        collectionView.register(LessonsCell.self, forCellWithReuseIdentifier: LessonsCell.identifier)
        collectionView.register(TrainerCell.self, forCellWithReuseIdentifier: TrainerCell.identifier)
        collectionView.register(LearningCell.self, forCellWithReuseIdentifier: LearningCell.identifier)
//        collectionView.register(cellWithClass: AppointmentOrderCell.self)
        
//        collectionView.register(supplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//                                withClass: ExpertInfoHeader.self)
//        collectionView.register(supplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//                                withClass: TitleHeader.self)
        
        collectionView.contentInset = .init(top: 20, left: 0, bottom: 20, right: 0)
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }()
    
    // MARK: - Init

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
        backgroundColor = .appBackground
    }

    private func setupSubviews() {
        addSubview(navBar)
        addSubview(collectionView)
        navBar.addSubview(leftStack)
        navBar.addSubview(rightStack)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 60),

            profileImageView.widthAnchor.constraint(equalToConstant: 30),
            profileImageView.heightAnchor.constraint(equalToConstant: 30),

            leftStack.centerYAnchor.constraint(equalTo: navBar.centerYAnchor),
            leftStack.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 16),

            rightStack.centerYAnchor.constraint(equalTo: navBar.centerYAnchor),
            rightStack.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -16)
        ])
        
        collectionView.anchor(.top(anchor: navBar.bottomAnchor, padding: 0),
                              .width(.equalTo(widthAnchor, multiplier: 1)),
                              .height(.equalTo(heightAnchor, multiplier: 1)))
    }
}
