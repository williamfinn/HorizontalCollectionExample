//
//  DateCell.swift
//  collectiontest
//
//  Created by William Finn on 15/03/2021.
//

import UIKit

class DateCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: DateCell.self)
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dayNumberLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            self.contentView.backgroundColor = isSelected ? .black : .white
            self.dayLabel.textColor = isSelected ? .white : .black
            self.dayNumberLabel.textColor = isSelected ? .white : .black
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        cellView()
    }
    
    private func cellView() {
        self.contentView.layer.cornerRadius = 8
    }
}
