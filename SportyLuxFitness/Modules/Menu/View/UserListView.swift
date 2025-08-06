//
//  MemberOperationsView.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 5.08.2025.
//

import UIKit

class UserListView: UIView {
    
    let plusButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(.plusIcon, for: .normal)
        return button
    }()
    
    let searchBar: MainTextField = {
        let sb = MainTextField()
        sb.placeholder = "Öğrenci Ara"
        sb.addLeadingIcon(with: UIImage(named: "searchIcon")!, iconTintColor: .secondaryText)
        sb.layer.cornerRadius = 24
        return sb
    }()
    
    let listCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.sectionInset = .zero
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 48, height: 81)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
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
        addSubview(listCollectionView)
        addSubview(searchBar)
    }
    
    private func layoutConstraints() {
        
        searchBar.anchor(.top(anchor: safeAreaLayoutGuide.topAnchor, padding: 8),
                         .leading(anchor: leadingAnchor, padding: 24),
                         .trailing(anchor: trailingAnchor, padding: 24),
                         .height(.constant(48)))
        
        listCollectionView.anchor(.top(anchor: searchBar.bottomAnchor, padding: 8),
                                  .width(.equalTo(widthAnchor, multiplier: 1)),
                                  .height(.equalTo(heightAnchor, multiplier: 1)))
    }
    
}
