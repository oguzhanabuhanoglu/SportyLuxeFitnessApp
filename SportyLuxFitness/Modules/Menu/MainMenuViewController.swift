//
//  MainMenuViewController.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 1.08.2025.
//

import UIKit

class MainMenuViewController: ViewController<MainMenuView> {
    
    private var role: AccountType?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSections()
        setupActions()
    }
    
    init(accountType: AccountType) {
        self.role = accountType
        super.init()
    }
    
    private func setupSections() {
        switch role {
        case .admin:
            navigationItem.title = "Admin Panel"
            mainView.trainerMenuVStavkView.isHiddenInStackView = true
        case .personalTrainer:
            navigationItem.title = "Eğitmen Panel"
            mainView.adminMenuVStavkView.isHiddenInStackView = true
        case .goldMember:
            navigationItem.title = "Admin Panel"
        case .regularMember:
            navigationItem.title = "Admin Panel"
        case nil:
            break
        }
    }
    
    private func setupActions() {
        
        mainView.memberOperationsButton.addAction(UIAction { [weak self] _ in
            self?.coordinator?.toOperationListVC(listType: .memberListForAdmin)
        }, for: .touchUpInside)
        
        mainView.ptOperationsButton.addAction(UIAction { [weak self] _ in
            self?.coordinator?.toOperationListVC(listType: .trainerListForAdmin)
        }, for: .touchUpInside)
        
        mainView.adminOperationsButton.addAction(UIAction { [weak self] _ in
            self?.coordinator?.toOperationListVC(listType: .adminList)
        }, for: .touchUpInside)
        
        mainView.grouplessonOperationsButton.addAction(UIAction { [weak self] _ in
            self?.coordinator?.toGroupLessonListVC()
        }, for: .touchUpInside)
    
        mainView.myStudentsButton.addAction(UIAction { [weak self] _ in
            self?.coordinator?.toOperationListVC(listType: .myStudentList)
        }, for: .touchUpInside)
        
        mainView.memberMeasrementRegisterButton.addAction(UIAction { [weak self] _ in
            self?.coordinator?.toOperationListVC(listType: .memberListForMeasurement)
        }, for: .touchUpInside)
    }
    


}
