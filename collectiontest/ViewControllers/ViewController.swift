//
//  ViewController.swift
//  collectiontest
//
//  Created by William Finn on 31/08/2020.
//

import UIKit

class ViewController: UIViewController {
    
    let labels = ["sm" , "big", "bigger", "even bigger", "much much bigger", "very very very large"]
    let colors: [UIColor] = [.green, .red, .orange, .blue, .purple, .lightGray, .cyan]
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        collectionView.collectionViewLayout = layoutConfig()
        collectionView.register(UINib(nibName: LabelCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: LabelCell.reuseIdentifier)
//        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func layoutConfig() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(44), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(44), heightDimension: .absolute(50))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        labels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCell.reuseIdentifier, for: indexPath) as! LabelCell
        cell.mainLabel.text = labels[indexPath.row]
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
}
