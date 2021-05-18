//
//  ViewController.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 13/04/21.
//

import UIKit


class ViewController: UIViewController {
        
	@IBOutlet weak var customCollection: CustomCollection!
	@IBOutlet weak var customTableView: CustomTableView!
	
	let alertController: UIAlertController = UIAlertController()
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		
		let container: ColorContainer = ColorContainer(firstElem: colorsArray1, secondElem: colorsArray2)
		self.customTableView.container = container
        self.customTableView.alertDelegate = self
		
		//inizializzazione della collection senza view di base
		self.customCollection.managedObjectsArray = colorsArray1
		self.customCollection.alertDelegate = self
		self.customCollection.bounds = self.view.bounds
    }
}


extension ViewController: TouchInCollectionCellDelegate {
	
	func showAlertAfterTouchInsideCell(managedColor: ManagedColor) {
		
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
