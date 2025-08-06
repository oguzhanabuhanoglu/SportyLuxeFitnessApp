//
//  EALabel.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 2.08.2025.
//

import UIKit

class MainLabel: UILabel {
    
    init(text: String?, font: UIFont, textColor: UIColor = .primaryBlack) {
        super.init(frame: .zero)
        
        self.font = font
        
        self.adjustsFontForContentSizeCategory = true
        
        self.text = text
        
        self.textColor = textColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func activateTapToCopy() {
        self.isUserInteractionEnabled = true
      
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.showMenu)))
    }
    
    func activateLogPressToCopy() {
        self.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(self.showMenu)))
    }
    
    @objc
    private func showMenu(_ recognizer:  UIGestureRecognizer) {
        self.becomeFirstResponder()
        
        let menu = UIMenuController.shared
        
        let locationOfTouchInLabel = recognizer.location(in: self)

        if !menu.isMenuVisible {
            var rect = bounds
            rect.origin = locationOfTouchInLabel
            rect.size = CGSize(width: 1, height: 1)
            menu.showMenu(from: self, rect: rect)
        }
    }
    
    override func copy(_ sender: Any?) {
        let board = UIPasteboard.general
        board.string = text
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(UIResponderStandardEditActions.copy)
    }

}
