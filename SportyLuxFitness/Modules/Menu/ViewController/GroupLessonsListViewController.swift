//
//  GroupLessonsListViewController.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 7.08.2025.
//

import UIKit

class GroupLessonsListViewController: ViewController<GroupLessonsListView> {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupActions()
    }
    
    private func setup() {
        navigationItem.title = "Grup Dersleri"
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: mainView.plusButton)
        view.backgroundColor = .appBackground
       
    }
    
    private func setupActions() {
        mainView.plusButton.addAction(UIAction { [weak self] _ in
            self?.coordinator?.toCreateLessonVC()
        }, for: .touchUpInside)
    }
    

}
