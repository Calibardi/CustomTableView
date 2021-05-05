//
//  ViewController.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 13/04/21.
//

import UIKit


class ViewController: UIViewController {
        
    @IBOutlet weak var collectionViewBeers: CustomCollectionView!
	@IBOutlet weak var customTblView: CustomTableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		
		let container: Container = Container(firstArray: beersArray, secondArray: ginArray)
		self.customTblView.container = container
		
		//inizializzazione della semplice collectionView
        self.collectionViewBeers.managedObjectsArray = beersArray
        self.collectionViewBeers.delegate = self
    }
}


extension ViewController: TouchInCollectionCellDelegate {
	
	/// Questa funzione gestisce l'alert che viene mostrato quando premiamo all'interno di una cella della `collectionView`.
	/// - Warning: il delegate associato è chiamato `TouchInCollectionCellDelegate` .
	/// - Parameter managedObject: Il contenuto gestito all'interno della cella, da visualizzare
	
	func showAlertAfterTouchInsideCell(managedObject: ManagedObject) {
		let alertController: UIAlertController = UIAlertController(title: "Birra: \(managedObject.title)", message: "Questa birra ha una gradazione alcolica del: \(managedObject.smallText)", preferredStyle: .alert)
		
		alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
			NSLog("The \"OK\" alert occured.")
		}))
		
		self.present(alertController, animated: true, completion: nil)
	}
}
