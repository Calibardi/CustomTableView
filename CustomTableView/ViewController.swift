//
//  ViewController.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 13/04/21.
//

import UIKit


class ViewController: UIViewController {
        
//    @IBOutlet weak var collectionViewBeers: CustomCollectionView!
//	@IBOutlet weak var customTblView: CustomTableView!
	@IBOutlet weak var customCollection: CustomCollection!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		
//		let container: Container = Container(firstArray: beersArray, secondArray: ginArray)
//		self.customTblView.container = container
//        self.customTblView.delegate = self
		
		//inizializzazione della semplice collectionView
//        self.collectionViewBeers.managedObjectsArray = beersArray
//        self.collectionViewBeers.delegate = self
		
		//inizializzazione della collection senza view di base
		self.customCollection.managedObjectsArray = colorsArray
		self.customCollection.alertDelegate = self
		self.customCollection.bounds = self.view.bounds
    }
}


extension ViewController: TouchInCollectionCellDelegate {

	func showAlertAfterTouchInsideCell(managedColor: ManagedColor) {
		let alertController: UIAlertController = UIAlertController(title: "\(managedColor.name)", message: "Colore", preferredStyle: .alert)
		
		alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
			NSLog("The \"OK\" alert occured.")
		}))
		
		self.present(alertController, animated: true, completion: nil)
	}
	
	
	
	/// Questa funzione gestisce l'alert che viene mostrato quando premiamo all'interno di una cella della `collectionView`.
	/// - Warning: il delegate associato è chiamato `TouchInCollectionCellDelegate` .
	/// - Parameter managedObject: Il contenuto gestito all'interno della cella, da visualizzare
	
	func showAlertAfterTouchInsideCell(managedObject: ManagedObject) {
		let alertController: UIAlertController = UIAlertController(title: "\(managedObject.title)", message: "Questo alcolico ha una gradazione del: \(managedObject.smallText)", preferredStyle: .alert)
		
		alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
			NSLog("The \"OK\" alert occured.")
		}))
		
		self.present(alertController, animated: true, completion: nil)
	}
}
