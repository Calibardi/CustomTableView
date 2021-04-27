//
//  CustomCollectionViewCell.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 21/04/21.
//

import UIKit 

class CustomCollectionViewCell: UICollectionViewCell {
	
	//Managed Object
	var managedObject: alcohol? {
		didSet {
			self.imageCellView.image = UIImage(named: managedObject?.imageLiteral ?? "placeholder.jpg") //inserire un immagine che faccia da placeholder in caso di mancato ritiro dell'immagine aspettata
			self.labelNameCell.text = managedObject?.name
			self.labelVolumeCell.text = formatter.stringNumberFrom(self.managedObject?.volume)
		}
	}
	
    @IBOutlet weak var imageCellView: UIImageView!
    @IBOutlet weak var labelNameCell: UILabel!
	@IBOutlet weak var labelVolumeCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		self.backgroundColor = .white
    }

}
