//
//  ViewController.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 13/04/21.
//

import UIKit


class ViewController: UIViewController {
	
	@IBOutlet weak var buttonTestDeinit: UIButton!
	@IBOutlet weak var customTableView: CustomTableView!
	
	let alertController: UIAlertController = UIAlertController()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Custom Table View"
		let container: ColorContainer = ColorContainer(firstElem: colorsArray1, secondElem: colorsArray2)
		self.customTableView.container = container
		self.customTableView.alertDelegate = self
		
		customiseBtn()
	}
	
	deinit {
		debugPrintString("Deinit called on main view controller!")
	}
}

extension ViewController: TouchInCollectionCellDelegate {
	
	func showAlertAfterTouchOnButton(managedColor: ManagedColor) {
		
		alertController.title = managedColor.name
		alertController.message = "che bel colore"
		
		if alertController.actions.isEmpty {
			alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
				NSLog("The \"OK\" alert occured.")
			}))
		}
		
		self.present(alertController, animated: true, completion: nil)
	}
}

extension ViewController {
	func customiseBtn() {
		self.buttonTestDeinit.layer.cornerRadius = 10.0
	}
}
