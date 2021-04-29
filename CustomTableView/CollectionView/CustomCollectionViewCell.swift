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
        // Initialization code
        
    }

}
