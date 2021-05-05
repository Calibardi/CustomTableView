//
//  ViewController.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 13/04/21.
//

import UIKit


class ViewController: UIViewController, TouchInCollectionCellDelegate {
    
    @IBOutlet weak var collectionViewBeers: CustomCollectionView!
	@IBOutlet weak var customTblView: CustomTableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		
        self.collectionViewBeers.managedObjectsArray = beersArray
        self.collectionViewBeers.delegate = self
		
		self.customTblView.managedObjectsArray1 = beersArray
		self.customTblView.managedObjectsArray2 = ginArray
        self.customTblView.delegate = self
    }
    
    func showAlertAfterTouchInsideCell(managedObject: ManagedObject) {
        let alertController: UIAlertController = UIAlertController(title: "Birra: \(managedObject.title)", message: "Questa birra ha una gradazione alcolica del: \(managedObject.header2)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alertController, animated: true, completion: nil)
    }
}
