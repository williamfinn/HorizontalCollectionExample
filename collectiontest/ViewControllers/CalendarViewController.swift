//
//  CalendarViewController.swift
//  collectiontest
//
//  Created by William Finn on 15/03/2021.
//

import UIKit

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    
    var dates = [Date]()
    
    // toggle these to set range
    var start = "2018-01-01"
    var end = "2023-01-01"
    
    var month: String?
    var selectedDate: Date?
    
    let dateTool = DateTool()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        getDates()
    }
    
    private func getDates() {
        dates = dateTool.datesRange(from: dateTool.getDate(str: start), to: dateTool.getDate(str: end))
        collectionView.reloadData()
        
        let current = dateTool.getCurrent()
        let first = dates.firstIndex(where: {$0 == current})
        
        if let f = first {
            view.layoutIfNeeded()
            collectionView.selectItem(at: IndexPath(row: f, section: 0), animated: false, scrollPosition: .centeredHorizontally)
            topLabelSet()
        }
    }
    
    private func topLabelSet() {
        topLabel.text = dateTool.getTop(date: selectedDate ?? Date())
    }
    
    private func setUpCollectionView() {
        collectionView.collectionViewLayout = layoutConfig()
        collectionView.register(UINib(nibName: DateCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: DateCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsSelection = true
    }
    
    private func layoutConfig() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(50), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(50), heightDimension: .absolute(50))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
    }
}

extension CalendarViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateCell.reuseIdentifier, for: indexPath) as! DateCell
        let date = dates[indexPath.row]
        cell.dayLabel.text = dateTool.getDay(date: date)
        cell.dayNumberLabel.text = dateTool.getNumber(date: date)
        return cell
    }
}

extension CalendarViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedDate = dates[indexPath.row]
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        topLabelSet()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let date = dates[indexPath.row]
        let cellMonth = dateTool.getMonth(date: date)
        if month != cellMonth {
            month = cellMonth
            monthLabel.text = month ?? ""
        }
    }
}
