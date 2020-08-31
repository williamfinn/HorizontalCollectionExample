//
//  labelcell.swift
//  collectiontest
//
//  Created by William Finn on 31/08/2020.
//

import UIKit

class labelcell: UICollectionViewCell {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    static let reuseIdentifier = String(describing: labelcell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
