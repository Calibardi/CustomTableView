//
//  CustomTableViewCell.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 24/05/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

	private var managedObjectsArray: [ManagedColor] = [ManagedColor]()
    weak var delegate: TouchInCollectionCellDelegate?
	
	@IBOutlet private weak var customCollectionView: UICollectionView!
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		self.customCollectionView.delegate = self
		self.customCollectionView.dataSource = self
		
		initCellNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	private func initCellNib() {
		let collectionViewCellNib = UINib(nibName: CustomCollectionViewCell.identifier, bundle: nil)
		self.customCollectionView.register(collectionViewCellNib, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
	}
    
    func populateCell(objectsArray: [ManagedColor]) {
        self.managedObjectsArray = objectsArray
    }

}

extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return managedObjectsArray.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
			return UICollectionViewCell()
		}
		
		cell.fillCell(with: managedObjectsArray[indexPath.item])
        cell.delegate = self.delegate
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell {
			cell.showSelection()
		}
		delegate?.userDidTapInCellToIncreaseProgress()
	}
	
	func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
		if let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell {
			cell.hideSelection()
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
		if let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell {
			cell.layer.shadowColor = #colorLiteral(red: 0.3940224051, green: 0.3368074298, blue: 0.9009161592, alpha: 1)
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
		if let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell {
			cell.layer.shadowColor = UIColor.black.cgColor
		}
	}
	
}

extension CustomTableViewCell {
	static var identifier: String {
		return String(describing: self)
	}
}
