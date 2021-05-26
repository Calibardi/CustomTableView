//
//  CustomCollectionViewCell.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 21/04/21.
//
import UIKit

class ManagedColor {
	
	var name: String
	var color: UIColor
	
	init(name: String, color: UIColor = .lightGray) {
		self.name = name
		self.color = color
	}
}

class CustomCollectionViewCell: UICollectionViewCell {
	    
	private var managedColor: ManagedColor?
	
    @IBOutlet weak private var imageCellView: UIImageView?
    @IBOutlet weak private var labelMainTitleCell: UILabel?
	@IBOutlet weak private var buttonAlert: UIButton?
	
	weak var delegate: TouchInCollectionCellDelegate?
    
    override internal func awakeFromNib() {
        super.awakeFromNib()
        
        //shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.white.cgColor
        
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 10
        
		self.imageCellView?.layer.cornerRadius = 10
		self.imageCellView?.layer.borderWidth = 1
		self.imageCellView?.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
		self.buttonAlert?.tintColor = .red
    }

	override internal func prepareForReuse() {
		super.prepareForReuse()
		
		self.imageCellView?.image = nil
		self.labelMainTitleCell?.text = ""
	}
    
	func fillCell(with object: ManagedColor) {
		
		self.imageCellView?.fill(with: object.color)
		self.labelMainTitleCell?.text = object.name
		self.managedColor = object
	}
	
	@IBAction private func showAlert(_ sender: Any) {
		if let bt = sender as? UIButton {
			delegate?.showAlertAfterTouchOnButton(managedColor: managedColor ?? ManagedColor(name: "NULL"))
		}
	}
	
	func showSelection(){ self.layer.shadowColor = UIColor.blue.cgColor }
	func hideSelection(){ self.layer.shadowColor = UIColor.black.cgColor }
	
//	deinit {
//		debugPrintString("deInit sulla collectionViewCell!")
//	}
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