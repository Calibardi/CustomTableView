//
//  CustomCollectionViewCell.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 21/04/21.
//

import UIKit 

class CustomCollectionViewCell: UICollectionViewCell {
	
	//Managed Object
	var managedObject: CollectionCellContent? {
		didSet {
//			self.imageCellView.image = UIImage(named: managedObject?.imageLiteral ?? "placeholder.jpg") //inserire un immagine che faccia da placeholder in caso di mancato ritiro dell'immagine aspettata
			self.labelMainTitleCell.text = managedObject?.title
            self.labelFooterCell.text = formatter.stringFromNumber(self.managedObject?.header2 ?? "")
            
		}
	}
	
//    @IBOutlet weak private var imageCellView: UIImageView!
    @IBOutlet weak private var labelMainTitleCell: UILabel!
    @IBOutlet weak private var labelFooterCell: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

}
