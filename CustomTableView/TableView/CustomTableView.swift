//
//  CustomTableView.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 30/04/21.
//

import UIKit

class CustomTableView: UIView, UITableViewDelegate, UITableViewDataSource {
        
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
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        <#code#>
    }
}

extension CustomTableView {
	static var identifier: String {
		return String(describing: self)
	}
}
