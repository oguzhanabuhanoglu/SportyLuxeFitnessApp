//
//  CreateLessonViewController.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 7.08.2025.
//

import UIKit

class CreateLessonViewController: ViewController<CreateLessonView> {
    
    private var selectedTrainer: Trainer?

    let trainers: [Trainer] = [
        Trainer(id: "12", name: "Yok", image: nil),
        Trainer(id: "123", name: "Arnold S.", image: UIImage(named: "arnold")),
        Trainer(id: "1234", name: "Arnold S.", image: UIImage(named: "arnold")),
        Trainer(id: "12345", name: "Arnold S.", image: UIImage(named: "arnold")),
        Trainer(id: "123456", name: "Arnold S.", image: UIImage(named: "arnold")),
        Trainer(id: "1234567", name: "Arnold S.", image: UIImage(named: "arnold")),
        Trainer(id: "1234567", name: "Ronnie C.", image: UIImage(named: "ronnie"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
       
    }
    
    private func setup() {
        navigationItem.title = "Yeni Ders Girişi"
        hideKeyboardWhenTappedAround()
        
        mainView.trainerSelectionView.collectionView.register(TrainerCell.self, forCellWithReuseIdentifier: TrainerCell.identifier)
        mainView.trainerSelectionView.collectionView.delegate = self
        mainView.trainerSelectionView.collectionView.dataSource = self
    }
    

    

}

extension CreateLessonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trainers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let trainer = trainers[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrainerCell.identifier, for: indexPath) as! TrainerCell

        let isSelected = trainer == selectedTrainer
        cell.configure(with: trainer, isSelected: isSelected)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let trainer = trainers[indexPath.item]
        selectedTrainer = trainer
        collectionView.reloadData()
        
        print("Seçilen eğitmen: \(trainer.name)")
    }
    
    
}
