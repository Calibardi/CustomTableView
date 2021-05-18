//
//  ManagedObjects.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 27/04/21.
//

import Foundation
import UIKit

//MARK: - Not in use
class ManagedObject {
	
	var title: String
	var imageLiteral: String
	var smallText: String
	
	init(title: String, imageName: String, header2: String) {
		self.title = title
		self.imageLiteral = imageName
		self.smallText = header2
	}
}

//MARK: - In use
class ManagedColor {
	
	var name: String
	var color: UIColor
	
	init(name: String, color: UIColor = .lightGray) {
		self.name = name
		self.color = color
	}
}
