//
//  MemberOperationsViewController.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 5.08.2025.
//

import UIKit

enum OperationListTypes {
    case memberListForAdmin
    case trainerListForAdmin
    case adminList
    case myStudentList
    case memberListForMeasurement
}

class UserListViewController: ViewController<UserListView> {
    
    let trainers: [Trainer] = [
        Trainer(id: "12", name: "Yok", image: nil),
        Trainer(id: "123", name: "Arnold S.", image: UIImage(named: "arnold")),
        Trainer(id: "1234", name: "Arnold S.", image: UIImage(named: "arnold")),
        Trainer(id: "12345", name: "Arnold S.", image: UIImage(named: "arnold")),
        Trainer(id: "123456", name: "Arnold S.", image: UIImage(named: "arnold")),
        Trainer(id: "1234567", name: "Arnold S.", image: UIImage(named: "arnold")),
        Trainer(id: "1234567", name: "Ronnie C.", image: UIImage(named: "ronnie"))
    ]
    
    //MARK: - Properties
    private var listType: OperationListTypes?
    
    //MARK: - Initialization
    init(listType: OperationListTypes) {
        self.listType = listType
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupActions()
        setupCollectionView()
    }
    
    //MARK: - Functions
    private func setup() {
        
        switch listType {
        case .memberListForAdmin:
            navigationItem.title = "Üye İşlemleri"
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: mainView.plusButton)
            
        case .trainerListForAdmin:
            navigationItem.title = "Eğitmen İşlemleri"
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: mainView.plusButton)
            
        case .adminList:
            navigationItem.title = "Admin İşlemleri"
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: mainView.plusButton)
            
        case .myStudentList:
            navigationItem.title = "Öğrencilerim"
            
        case .memberListForMeasurement:
            navigationItem.title = "Üye Ölçüm Kayıt"
        case nil:
            break
        }
    }
    
    private func setupActions() {
        mainView.plusButton.addAction(UIAction { [weak self] _ in
            switch self?.listType {
            case .memberListForAdmin:
                self?.coordinator?.toMemberRegisterVC(accountType: .regularMember)
            case .trainerListForAdmin:
                self?.coordinator?.toMemberRegisterVC(accountType: .personalTrainer)
            case .adminList:
                self?.coordinator?.toMemberRegisterVC(accountType: .admin)
            case .myStudentList:
                break
            case .memberListForMeasurement:
                break
            case nil:
                break
            }
            
        }, for: .touchUpInside)
    }
    
    private func setupCollectionView() {
        
        mainView.listCollectionView.register(ListCell.self, forCellWithReuseIdentifier: ListCell.identifier)
        mainView.listCollectionView.delegate = self
        mainView.listCollectionView.dataSource = self
    }

   

}


extension UserListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trainers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let trainer = trainers[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.identifier, for: indexPath) as! ListCell
        cell.configure(with: trainer)
        return cell
    }
    
    
}
