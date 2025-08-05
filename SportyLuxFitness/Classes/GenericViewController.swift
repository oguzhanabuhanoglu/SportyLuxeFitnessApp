//
//  ViewController.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 31.07.2025.
//

import UIKit

class ViewController<MainView: UIView>: UIViewController {
    
    let mainView = MainView()
    
    weak var coordinator: MainCoordinator?
    
    var shouldHideNavBar: Bool { false }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(shouldHideNavBar, animated: false)
        navigationItem.backButtonTitle = ""
    }
    
    
    //MARK: - Online content protocol properties
    //    var contentView: UIView? {
    //        didSet {
    //            controllerStatus = .initialState
    //        }
    //    }
    
    //    var refresher: UIRefreshControl?
    
    //    var controllerStatus: ControllerStatus = .initialState {
    //        didSet {
    //            updateControllerStatus(controllerStatus)
    //        }
    //    }
    
    func getData(/*loading: LoadingStatus*/) {}
    
    
    //MARK: - Initialization
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable, message: "Nibs are unsupported")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setTitle()
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
}

