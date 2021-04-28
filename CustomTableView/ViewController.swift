//
//  ViewController.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 13/04/21.
//

import UIKit

class Beer: CollectionCellContent {
}

class ViewController: UIViewController {

    @IBOutlet weak var collectionViewBeers: CustomCollectionView!
    
    let beersArray = [
        Beer(title: "Non saprei", imageName: "", header2: 12.5),
        Beer(title: "Peroni", imageName: "", header2: 13.5),
        Beer(title: "Leffe", imageName: "", header2: 16),
        Beer(title: "Cazzottino", imageName: "", header2: 11)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.collectionViewBeers.managedObjectsArray = beersArray
    }
}

