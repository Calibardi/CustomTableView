//
//  CustomCollectionView.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 21/04/21.
//

import UIKit

class CustomCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var linearCollectionView: UICollectionView!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    //MARK: - Collection view datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
}
