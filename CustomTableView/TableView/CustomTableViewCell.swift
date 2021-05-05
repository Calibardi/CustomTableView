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
	
	#warning("probabilmente inutile")
	override func prepareForReuse() {
		super.prepareForReuse()
		
		self.viewCustomCollection.managedObjectsArray.removeAll()
	}
}

extension CustomTableViewCell {
	static var identifier: String {
		return String(describing: self)
	}
}
