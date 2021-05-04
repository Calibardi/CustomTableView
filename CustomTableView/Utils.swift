//
//  Utils.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 27/04/21.
//

import Foundation

let collectionID = "CustomCollectionView"

class formatter {
	
	let numberFormatter: NumberFormatter

	static let sharedInstance = formatter()
	
	init() {
		numberFormatter = NumberFormatter()
		numberFormatter.numberStyle = .percent
		numberFormatter.maximumFractionDigits = 1
		numberFormatter.minimumFractionDigits = 1
		numberFormatter.multiplier = 1.0
	}
	
	static public func stringFromNumber(_ obj: Any?) -> String {
		return self.sharedInstance.numberFormatter.string(for: obj) ?? "X"
	}
}

func debugPrintString(_ string: String) {
	NSLog("[DEBUG] ~> " + string)
}
// MARK: - Protocollo/delegate
protocol TouchInCollectionCell {
    func showAlertAfterTouchInsideCell(managedObject: ManagedObject)
}
