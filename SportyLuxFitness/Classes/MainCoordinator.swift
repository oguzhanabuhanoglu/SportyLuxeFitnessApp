//
//  MainCoordinator.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 1.08.2025.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        
        let transition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = .fade
        
        navigationController.view.layer.add(transition, forKey: nil)
        
        if UserManager.isUserLoggedIn {
            
            let vc = HomeViewController()
            vc.coordinator = self
            navigationController.setViewControllers([vc], animated: false)
            
        } else {
            
            let vc = LoginViewController()
            vc.coordinator = self
            navigationController.setViewControllers([vc], animated: false)
        }
        
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        //guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {return}
                
    }
    
}

extension MainCoordinator {
//    func onboarding() {
//        let vc = OnboardingViewController()
//        vc.coordinator = self
//        navigationController.pushViewController(vc, animated: true)
//    }
//    
    func toVerificationVC() {
        let vc = VerificationViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
