//
//  CustomCollectionViewCell.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 21/04/21.
//
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
	
    static public let cellID = "CustomCollectionViewCell"
    
    var managedObject: CollectionCellContent? {
        didSet {
            
            if let image = UIImage(named: managedObject?.imageLiteral ?? ""){
                self.imageCellView.image = image
            } else {
                self.imageCellView.image = UIImage(named: "placeholder")
            }
            
            self.labelMainTitleCell.text    = managedObject?.title
            self.labelFooterCell.text       = managedObject?.header2
        }
    }
	
    @IBOutlet weak private var imageCellView: UIImageView!
    @IBOutlet weak private var labelMainTitleCell: UILabel!
    @IBOutlet weak private var labelFooterCell: UILabel!
    @IBOutlet weak var imageIfSelected: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //shadow
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.white.cgColor
        
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 10
        
        //cella
        
        self.imageIfSelected.tintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)

        self.imageCellView.layer.cornerRadius = 10
        self.imageCellView.layer.borderWidth = 1
        self.imageCellView.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        self.hideSelection()
        
    }

    func showSelection(){ imageIfSelected.alpha = 0.5 }
    func hideSelection(){ imageIfSelected.alpha = 0.0 }
    
}
