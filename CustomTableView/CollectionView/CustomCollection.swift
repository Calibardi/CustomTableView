//
//  CustomCollection.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 16/05/21.
//

import UIKit

class CustomCollection: UICollectionView {
	
	var managedObjectsArray: [ManagedColor] = [ManagedColor]()
	var alertDelegate: TouchInCollectionCellDelegate?

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(CustomCollection.identifier, owner: self, options: nil)
//        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.layer.backgroundColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        self.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
		
		delegate		= self
		dataSource 		= self
		
		initCellNib()
        
    }
	
	private func initCellNib() {
		let collectionViewCellNib = UINib(nibName: CustomCollectionViewCell.identifier, bundle: nil)
		self.register(collectionViewCellNib, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
	}
	
}

//MARK: - CollectionView dataSource & delegate methods

extension CustomCollection: UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return managedObjectsArray.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
			return UICollectionViewCell()
		}
		
		cell.fillCell(with: self.managedObjectsArray[indexPath.item])
		cell.delegate = alertDelegate
		
		debugPrintString("[Collection cellForItemAt] -> \(indexPath.item)")

		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell {
			cell.showSelection()
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
		if let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell {
			cell.hideSelection()
		}
		alertDelegate?.userDidTapInCellToIncreaseProgress()
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

//MARK: - Class identifier

extension CustomCollection {
    static var identifier: String {
        return String(describing: self)
    }
}
