//
//  CustomCollectionView.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 21/04/21.
//

import UIKit

//@IBDesignable
class CustomCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
	var managedObjectsArray: [ManagedObject] = [ManagedObject]()
    var delegate: TouchInCollectionCellDelegate?
	
	@IBOutlet private var contentView: UIView!
	@IBOutlet weak private var collectionView: UICollectionView!
    
	//MARK: - class inits
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commonInit()
	}
	
	private func commonInit() {
		
        Bundle.main.loadNibNamed(CustomCollectionView.identifier, owner: self, options: nil)
		addSubview(contentView)
		contentView.frame = self.bounds
		contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
		self.layer.backgroundColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		initCellNib()
		
		debugPrintString("commonInitCalled")
	}
    
    private func initCellNib() {
        let collectionViewCellNib = UINib(nibName: CustomCollectionViewCell.identifier, bundle: nil)
        self.collectionView.register(collectionViewCellNib, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }

    //MARK: - Collection view datasource/delegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        debugPrintString("[Collection numberOfItemsInSection] \(managedObjectsArray.count)")
        return managedObjectsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        
        cell.managedObject = self.managedObjectsArray[indexPath.item]
        debugPrintString("[Collection cellForItemAt] -> \(indexPath.item)")

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell {
            print("\(cell.managedObject?.title ?? "") VOL: \(cell.managedObject?.smallText ?? "")")
            delegate?.showAlertAfterTouchInsideCell(managedObject: cell.managedObject ?? managedObjectsArray[indexPath.item])
            cell.showSelection()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell {
            cell.hideSelection()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell {
            cell.layer.shadowColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell {
            cell.layer.shadowColor = UIColor.lightGray.cgColor
        }
    }
}

extension CustomCollectionView {
	static var identifier: String {
		return String(describing: self)
	}
}
