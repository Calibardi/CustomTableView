//
//  CustomCollectionViewCell.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 21/04/21.
//
import UIKit

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
	
    var managedObject: CollectionCellContent? {
        didSet {
            
            if let image = UIImage(named: managedObject?.imageLiteral ?? ""){
                self.imageCellView.image = image
            } else {
                self.imageCellView.image = UIImage(named: "placeholder")
            }
            
            self.labelMainTitleCell.text    = managedObject?.title
            self.labelFooterCell.text       = formatter.stringFromNumber(self.managedObject?.header2 ?? "")
        }
    }
	
    @IBOutlet weak private var imageCellView: UIImageView!
    @IBOutlet weak private var labelMainTitleCell: UILabel!
    @IBOutlet weak private var labelFooterCell: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.white.cgColor
        
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 10
    }

}
