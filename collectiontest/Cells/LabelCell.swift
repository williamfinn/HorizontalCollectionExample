//
//  LabelCell.swift
//  collectiontest
//
//  Created by William Finn on 31/08/2020.
//

import UIKit

class LabelCell: UICollectionViewCell {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    static let reuseIdentifier = String(describing: LabelCell.self)
}
