//
//  CustomCollectionViewCell.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 21/04/21.
//
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
	    
    @IBOutlet weak private var imageCellView: UIImageView!
    @IBOutlet weak private var labelMainTitleCell: UILabel!
    @IBOutlet weak var imageIfSelected: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //shadow
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 3.0
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

	override func prepareForReuse() {
		super.prepareForReuse()
		
		self.imageCellView.image = nil
		self.labelMainTitleCell.text = ""
		self.hideSelection()
	}
    
	func fillCell(with object: ManagedColor) {
		
		self.imageCellView.fill(with: object.color)
		self.labelMainTitleCell.text = object.name
		
	}
	
	func showSelection(){ imageIfSelected.alpha = 0.5 }
	func hideSelection(){ imageIfSelected.alpha = 0.0 }
}

extension CustomCollectionViewCell {
	static var identifier: String {
		return String(describing: self)
	}
}

extension UIImageView {
	func fill(with color: UIColor = .lightGray) {
		let size = self.bounds.size
		let image = UIGraphicsImageRenderer(size: size).image { rendererContext in
			color.setFill()
			rendererContext.fill(CGRect(origin: .zero, size: size))
		}
		self.image = image
	}
}
