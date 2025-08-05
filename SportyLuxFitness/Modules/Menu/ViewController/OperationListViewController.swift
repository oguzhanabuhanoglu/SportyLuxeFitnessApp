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

class OperationListViewController: ViewController<MemberOperationsView> {
    
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
    

   

}
