//
//  MainMenuView.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 1.08.2025.
//

import UIKit

class MainMenuView: UIView {
    
    //MARK: Admin buttons
    let memberOperationsButton: MainButton = {
        let button = MainButton(title: "Üye İşlemleri", style: .secondary)
        return button
    }()
    
    let ptOperationsButton: MainButton = {
        let button = MainButton(title: "Eğitmen İşlemleri", style: .secondary)
        return button
    }()
    
    let adminOperationsButton: MainButton = {
        let button = MainButton(title: "Admin İşlemleri", style: .secondary)
        return button
    }()

    let grouplessonOperationsButton: MainButton = {
        let button = MainButton(title: "Grup Dersi İşlemleri", style: .secondary)
        return button
    }()
    
    let myStudentsButton: MainButton = {
        let button = MainButton(title: "Öğrencilerim", style: .secondary)
        return button
    }()
    
    let memberMeasrementRegisterButton: MainButton = {
        let button = MainButton(title: "Üye Ölçüm Kayıt", style: .secondary)
        return button
    }()
    
    lazy var mainVStavkView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [adminMenuVStavkView,
                                                   trainerMenuVStavkView])
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    lazy var adminMenuVStavkView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [memberOperationsButton,
                                                   ptOperationsButton,
                                                   adminOperationsButton,
                                                   grouplessonOperationsButton,
                                                   myStudentsButton,
                                                   memberMeasrementRegisterButton])
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    lazy var trainerMenuVStavkView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [myStudentsButton,
                                                   memberMeasrementRegisterButton])
        stack.axis = .vertical
        stack.spacing = 16
        return stack
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
        addSubview(mainVStavkView)
    }
    
    private func layoutConstraints() {
        mainVStavkView.translatesAutoresizingMaskIntoConstraints = false
        
        mainVStavkView.anchor(.top(anchor: safeAreaLayoutGuide.topAnchor, padding: 16),
                              .leading(anchor: leadingAnchor, padding: 20),
                              .trailing(anchor: trailingAnchor, padding: 20))
        
        // Her bir butona sabit yükseklik ver
        [memberOperationsButton,
         ptOperationsButton,
         adminOperationsButton,
         grouplessonOperationsButton,
         myStudentsButton,
         memberMeasrementRegisterButton].forEach { button in
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
}
