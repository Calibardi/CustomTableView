//
//  CustomTableView.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 30/04/21.
//

import UIKit

class CustomTableView: UIView, UITableViewDelegate, UITableViewDataSource {
        
	var managedObjectsArray1: [ManagedObject] = [ManagedObject]()
	var managedObjectsArray2: [ManagedObject] = [ManagedObject]()
    
    var delegate: TouchInCollectionCellDelegate?
	
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tableViewCustom: UITableView!
    
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
        
        Bundle.main.loadNibNamed(CustomTableView.identifier, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.layer.backgroundColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        tableViewCustom.delegate = self
        tableViewCustom.dataSource = self
        
        cellInit()
    }
    
    private func cellInit() {
        let tableViewCellNib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        self.tableViewCustom.register(tableViewCellNib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
//    MARK: - Tableview datasource/delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
    
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		switch section {
		case 0:
			return "Beers"
		case 1:
			return "Gin"
		default:
			return ""
		}
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 170
	}
	
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        
		if indexPath.section == 0 {
            
			cell.populateWith(object: managedObjectsArray1)
            cell.viewCustomCollection.delegate = delegate
		} else {
            
			cell.populateWith(object: managedObjectsArray2)
            cell.viewCustomCollection.delegate = delegate
		}
		
		return cell
		
    }
}

extension CustomTableView {
	static var identifier: String {
		return String(describing: self)
	}
}
