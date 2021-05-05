//
//  CustomTableView.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 30/04/21.
//

import UIKit

enum sections: Int {
	case firstContent
	case secondContent
}
///Questa tableView è costruita per gestire due sole celle, il contenuto di queste celle piò essere definito tramite l'inizializzazione di una classe `Container`
///e riempendola cone due array di oggetti conformi a `ManagedObject`
class CustomTableView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var delegate: TouchInCollectionCellDelegate?
	var container: Container?
	
    @IBOutlet private var contentView: UIView!
    @IBOutlet weak private var tableViewCustom: UITableView!
    
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
    
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 170
	}
	
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell

		
		switch indexPath.section {
		case sections.firstContent.rawValue:
        
			cell.populateWith(object: container?.firstContent ?? [ManagedObject]())
        cell.viewCustomCollection.delegate = delegate
        
		case sections.secondContent.rawValue:
        
			cell.populateWith(object: container?.secondContent ?? [ManagedObject]())
        cell.viewCustomCollection.delegate = delegate

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
