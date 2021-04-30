//
//  CustomTableView.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 30/04/21.
//

import UIKit

class CustomTableView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    static public let tableViewID = "CustomTableView"
    
    
    //MARK: - Class Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
//        Bundle.main.loadNibNamed(, owner: self, options: nil)
//        addSubview(contentView)
//        contentView.frame = self.bounds
//        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//        self.layer.backgroundColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
//
//        collectionView.delegate = self
//        collectionView.dataSource = self
//
//        let collectionViewCellNib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
//        self.collectionView.register(collectionViewCellNib, forCellWithReuseIdentifier: "customCollectionViewCell")
//
//        debugPrintString("commonInitCalled")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
