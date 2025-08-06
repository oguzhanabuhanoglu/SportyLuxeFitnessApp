//
//  GroupLessonsListView.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 7.08.2025.
//

import UIKit

class GroupLessonsListView: UIView {

    let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "plusIcon"), for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .appBackground
    }
    
    private func setupSubviews() {
       
    }
    
    private func layourConstraints() {
        
    }

}
