//
//  CustomCollection.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 16/05/21.
//

import UIKit

class CustomCollection: UICollectionView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

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
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.layer.backgroundColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        self.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
    }
}

extension CustomCollection {
    static var identifier: String {
        return String(describing: self)
    }
}
