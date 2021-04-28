//
//  ManagedObjects.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 27/04/21.
//

import Foundation

class CollectionCellContent {
	
	var title: String
	var imageLiteral: String
	var header2: Float
	
	init(title: String, imageName: String, header2: Float) {
		self.title = title
		self.imageLiteral = imageName
		self.header2 = header2
	}
	
}
