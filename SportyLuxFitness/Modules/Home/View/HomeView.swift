//
//  HomeView.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 1.08.2025.
//

import UIKit

class HomeView: UIView {
    
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    
    func setup() {
        backgroundColor = .appBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
