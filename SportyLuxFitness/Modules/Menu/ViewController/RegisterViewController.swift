//
//  RegisterMemberViewController.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 5.08.2025.
//

import UIKit

class RegisterViewController: ViewController<RegisterView> {
    
    private var selectedTrainer: Trainer?
    
    private var role: AccountType?
    
    //MARK: - Initialization
    init(accountType: AccountType) {
        self.role = accountType
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }
    
    private func setup() {
        navigationItem.title = "Üye Kayıt"
        hideKeyboardWhenTappedAround()
        
        mainView.trainerSelectionView.collectionView.dataSource = self
        mainView.trainerSelectionView.collectionView.delegate = self
        mainView.trainerSelectionView.collectionView.register(TrainerCell.self, forCellWithReuseIdentifier: TrainerCell.identifier)
        
        switch role {
        case .admin:
            navigationItem.title = "Admin Kayıt"
            mainView.memberInfosVStack.isHiddenInStackView = true
            mainView.trainerInfosVStack.isHiddenInStackView = true
        case .personalTrainer:
            navigationItem.title = "Eğitmen Kayıt"
            mainView.memberInfosVStack.isHiddenInStackView = true
        case .goldMember:
            navigationItem.title = "Üye Kayıt"
            mainView.trainerInfosVStack.isHiddenInStackView = true
            mainView.addProfilePictureView.isHiddenInStackView = true
        case .regularMember:
            navigationItem.title = "Üye Kayıt"
            mainView.trainerInfosVStack.isHiddenInStackView = true
            mainView.addProfilePictureView.isHiddenInStackView = true
        case nil:
            break
        }
    }
    
    
    
}

struct Trainer: Equatable {
    let id: String
    let name: String
    let image: UIImage?
    
    static func == (lhs: Trainer, rhs: Trainer) -> Bool {
        return lhs.id == rhs.id
    }
}

let trainers: [Trainer] = [
    Trainer(id: "12", name: "Yok", image: nil),
    Trainer(id: "123", name: "Arnold S.", image: UIImage(named: "arnold")),
    Trainer(id: "1234", name: "Arnold S.", image: UIImage(named: "arnold")),
    Trainer(id: "12345", name: "Arnold S.", image: UIImage(named: "arnold")),
    Trainer(id: "123456", name: "Arnold S.", image: UIImage(named: "arnold")),
    Trainer(id: "1234567", name: "Arnold S.", image: UIImage(named: "arnold")),
    Trainer(id: "1234567", name: "Ronnie C.", image: UIImage(named: "ronnie"))
]

extension RegisterViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trainers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let trainer = trainers[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrainerCell.identifier, for: indexPath) as! TrainerCell

        let isSelected = trainer == selectedTrainer
        cell.configure(with: trainer, isSelected: isSelected)

        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let trainer = trainers[indexPath.item]
        selectedTrainer = trainer
        collectionView.reloadData()
        
        print("Seçilen eğitmen: \(trainer.name)")
    }
    
    
    
    
}
