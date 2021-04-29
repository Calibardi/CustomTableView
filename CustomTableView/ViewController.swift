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
        Beer(title: "Leffe", imageName: "leffe", header2: 12.5),
        Beer(title: "Delirium Tremens", imageName: "delirium", header2: 13.5),
        Beer(title: "Spitfire", imageName: "spitfire", header2: 16),
        Beer(title: "Lupulus", imageName: "lupulus", header2: 11)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.collectionViewBeers.managedObjectsArray = beersArray
    }
}

