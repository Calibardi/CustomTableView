//
//  CustomCollectionView.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 21/04/21.
//

import UIKit

class CustomCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
	var managedObjectsArray: [alcohol] = [alcohol]()
	
	@IBOutlet var contentView: UIView!
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var linearCollectionView: UICollectionView!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
	
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
		
		Bundle.main.loadNibNamed("CustomCollectioView", owner: self, options: nil)
		addSubview(contentView)
		contentView.frame = self.bounds
		contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
		self.layer.backgroundColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		let collectionViewCellNib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
		self.collectionView.register(collectionViewCellNib, forCellWithReuseIdentifier: "customCollectionViewCell")
		
		debugPrintString("commonInitCalled")
	}

    //MARK: - Collection view datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
