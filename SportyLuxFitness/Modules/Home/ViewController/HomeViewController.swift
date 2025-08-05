//
//  HomeViewController.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 1.08.2025.
//

import UIKit

class HomeViewController: ViewController<HomeView> {
    
    //MARK: - Typealias
    typealias Datasource = UICollectionViewDiffableDataSource<HomeSection, HomeSectionItemWraper>
    
    typealias Snapshot = NSDiffableDataSourceSnapshot<HomeSection, HomeSectionItemWraper>

    
    //MARK: - Properties
    override var shouldHideNavBar: Bool { true }
    private var accountType: AccountType?

    private var datasource: Datasource!
    
    private var sections: [HomeLayoutSection] = []
    
    override init() {
        accountType = .admin
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupActions()
    }
    
    private func setupActions() {
        
        if self.accountType == .regularMember || self.accountType == .goldMember {
            mainView.menuButton.isHidden = true
        }
        
        mainView.menuButton.addAction(UIAction { [weak self] _ in
            self?.coordinator?.toMenu(accountType: self?.accountType ?? .personalTrainer)
        }, for: .touchUpInside)
        
        mainView.bellButton.addAction(UIAction { [weak self] _ in
            self?.coordinator?.toNotifications()
        }, for: .touchUpInside)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else {return nil}
            return self.sections[sectionIndex].layoutSection
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 16
//        layout.register(HomeAppointmentsSectionDecorationReusableView.self,
//                        forDecorationViewOfKind: Constants.homeAppointmentsSectionDecorationView)
        layout.configuration = config
        
        return layout
    }

    private func createDataSource() {
        datasource = Datasource(collectionView: mainView.collectionView) { [weak self] collectionView, indexPath, item in
            guard let self = self else {return nil}
            let cell = self.sections[indexPath.section].cell(collectionView, indexPath, item)
            return cell
        }

        datasource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let self = self else {return nil}
            let section = self.sections[indexPath.section]
            let header = section.header(collectionView, kind: kind, indexPath)
            return header
        }
    }
    

}
