////
////  OnlineContent.swift
////  SportyLuxFitness
////
////  Created by Oğuzhan Abuhanoğlu on 1.08.2025.
////
//
//import UIKit
//
//protocol OnlineContent {
//    var controllerStatus: ControllerStatus { get set }
//    
//    var contentView: UIView? { get }
//    
//    var refresher: UIRefreshControl? { get }
//    
//    func getData(loading: LoadingStatus)
//    
//    func updateControllerStatus(_ status: ControllerStatus)
//}
//
//
//extension OnlineContent where Self: UIViewController {
//    
//    func updateControllerStatus(_ status: ControllerStatus) {
//        switch status {
//        case .loading(let loading):
//            switch loading {
//            case .off:
//                break
//                
//            case .show:
//                DispatchQueue.main.async {
//                    self.showSpinner()
//                }
//            }
//            
//        case .contentReady:
//            stopSpinners()
//            contentViewIsHidden(false)
//            self.children.forEach { vc in
//                if vc is InfoPageViewController {
//                    vc.remove()
//                }
//            }
//            
//            
//        case .initialState:
//            contentViewIsHidden(true)
//            
//        case .emptyContent(let type):
//            stopSpinners()
//            let vc = InfoPageViewController(type: type)
//            vc.actionButtonPressed = { [weak self] in
//                self?.navigationController?.popViewController()
//            }
//            self.add(vc)
//
//        case .failure(let error):
//            stopSpinners()
//            errorHandler(error, vc: self)
//            
//        }
//    }
//    
//    func stopSpinners() {
//        self.removeSpinner()
//        if (refresher?.isRefreshing ?? false) {
//            refresher?.endRefreshing()
//        }
//    }
//    
//    private func contentViewIsHidden(_ hidden: Bool) {
//        if hidden {
//            contentView?.alpha = 0
//            contentView?.isHidden = true
//        }
//        else {
//            if (contentView?.isHidden ?? true) {
//                UIView.animate(withDuration: 0.25) {
//                    self.contentView?.alpha = 1
//                    self.contentView?.isHidden = false
//                }
//            }
//        }
//    }
//    
//    private func errorHandler(_ error: NetworkError, vc: UIViewController?) {
//        switch error {
//        case .noInternetConnection:
//            let infoPageVC = InfoPageViewController(type: .noInternetConnection)
//            infoPageVC.actionButtonPressed = { [weak self] in
//                guard let self = self else {return}
//
//                self.children.forEach { vc in
//                    if vc is InfoPageViewController {
//                        vc.remove()
//                    }
//                }
//                self.getData(loading: .show)
//            }
//
//            DispatchQueue.main.async {
//                self.add(infoPageVC)
//            }
//        
//        default:
//
//            let infoPageVC = InfoPageViewController(type: .connectionError)
//            infoPageVC.actionButtonPressed = { [weak self] in
//                guard let self = self else {return}
//
//                self.children.forEach { vc in
//                    if vc is InfoPageViewController {
//                        vc.remove()
//                    }
//                }
//                self.getData(loading: .show)
//            }
//
//            DispatchQueue.main.async {
//                self.add(infoPageVC)
//            }
//        }
//    }
//}
//
//
//
//enum ControllerStatus {
//    
//    case loading(LoadingStatus)
//    
//    case contentReady
//    
//    case initialState
//    
//    case emptyContent(type: InfoPageTypes)
//    
//    case failure(_ error: NetworkError)
//}
//
//enum LoadingStatus {
//    case off
//    
//    case show
//}
