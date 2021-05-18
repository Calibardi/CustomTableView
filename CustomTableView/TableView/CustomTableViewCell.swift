//
//  CustomTableViewCell.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 30/04/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
	@IBOutlet weak var customCollection: CustomCollection!
	
	func populateWith(object: [ManagedColor]) {
		self.customCollection.managedObjectsArray = object
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		self.customCollection.managedObjectsArray.removeAll()
	}
}

extension CustomTableViewCell {
	static var identifier: String {
		return String(describing: self)
	}
}
