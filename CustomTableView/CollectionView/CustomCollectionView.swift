//
//  CustomCollectionView.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 21/04/21.
//

import UIKit

//@IBDesignable
class CustomCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
	var managedObjectsArray: [CollectionCellContent] = [CollectionCellContent]()
	
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
		
		Bundle.main.loadNibNamed(collectionID, owner: self, options: nil)
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
        let collectionViewCellNib = UINib(nibName: cellID, bundle: nil)
        self.collectionView.register(collectionViewCellNib, forCellWithReuseIdentifier: cellID)
    }

    //MARK: - Collection view datasource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        debugPrintString("[Collection numberOfItemsInSection] \(managedObjectsArray.count)")
        return managedObjectsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CustomCollectionViewCell
        
        cell.managedObject = self.managedObjectsArray[indexPath.item]
        debugPrintString("[Collection cellForItemAt] -> \(indexPath.item)")

        return cell
    }
    
}
