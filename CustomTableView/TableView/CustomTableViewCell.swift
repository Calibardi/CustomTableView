//
//  CustomTableViewCell.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 30/04/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
	@IBOutlet weak var viewCustomCollection: CustomCollectionView!
	
	func populateWith(object: [ManagedObject]) {
		self.viewCustomCollection.managedObjectsArray = object
	}
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension CustomTableViewCell {
	static var identifier: String {
		return String(describing: self)
	}
}
