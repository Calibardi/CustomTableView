//
//  CustomTableView.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 30/04/21.
//

import UIKit

enum rows: Int {
	case firstContent
	case secondContent
}
///Questa tableView è costruita per gestire due sole celle, il contenuto di queste celle piò essere definito tramite l'inizializzazione di una classe `Container`
///e riempendola cone due array di oggetti conformi a `ManagedColor`
class CustomTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var alertDelegate: TouchInCollectionCellDelegate?
	var container: ColorContainer?
	    
    //MARK: - Class Inits
	override init(frame: CGRect, style: UITableView.Style) {
		super.init(frame: frame, style: style)
		commonInit()
	}
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
        Bundle.main.loadNibNamed(CustomTableView.identifier, owner: self, options: nil)
//        addSubview(contentView)
//        contentView.frame = self.bounds
//        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.layer.backgroundColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
		
        self.delegate = self
        self.dataSource = self
        
        cellInit()
    }
    
    private func cellInit() {
        let tableViewCellNib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        self.register(tableViewCellNib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
	
	func pupulate(with container: ColorContainer) {
		self.container = container
	}
    
//    MARK: - Tableview datasource/delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if container == nil {
			return 0
		} else { return 2 }
    }
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
    
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 120
	}
	
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }

		switch indexPath.row {
		
		case rows.firstContent.rawValue:
        
			cell.populateWith(object: container?.firstContent ?? [ManagedColor]())
			cell.customCollection.alertDelegate = alertDelegate
			
		case rows.secondContent.rawValue:
        
			cell.populateWith(object: container?.secondContent ?? [ManagedColor]())
			cell.customCollection.alertDelegate = alertDelegate

		default:
			return cell
		}
		
		return cell
		
    }
}

extension CustomTableView {
	static var identifier: String {
		return String(describing: self)
	}
}
