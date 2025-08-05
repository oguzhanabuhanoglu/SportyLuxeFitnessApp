//
//  HomeLayoutSection.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 4.08.2025.
//

import UIKit

protocol HomeLayoutSection {
    var type: HomeSection {get}
            
    var layoutSection: NSCollectionLayoutSection {get}
    
    func cell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ item: HomeSectionItemWraper) -> UICollectionViewCell?
                        
    func header(_ collectionView: UICollectionView, kind: String, _ indexPath: IndexPath) -> UICollectionReusableView?
        
}

extension HomeLayoutSection {
    func header(_ collectionView: UICollectionView, kind: String, _ indexPath: IndexPath) -> UICollectionReusableView? {
        return nil
    }
    
}

enum HomeSection: Hashable {
    case calendar
    case busyness
    case program
    case groupLessons
    case personalTrainers
    case learn
}

enum HomeSectionItemWraper: Hashable {
    case calendar
    case busyness
    case program
    case groupLessons
    case personalTrainers
    case learn
}


