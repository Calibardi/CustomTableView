//
//  SecondaryViewController.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 19/05/21.
//

import UIKit

class SecondaryViewController: UIViewController {

	@IBOutlet weak var customTableView: CustomTableView!
	@IBOutlet weak var buttonRiempimento: UIButton!
	
	var container: ColorContainer?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		title = "Deinit Test"
        // Do any additional setup after loading the view.
		
//		self.container = ColorContainer(firstElem: colorsArray2, secondElem: colorsArray1)
//		self.customTableView.container = container
		
		customiseButtontRiempimento()
    }
    
	deinit {
		debugPrintString("Deinit called per la view secondaria")
		self.container = nil
	}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

	
	@IBAction func riempiTableView(_ sender: Any) {
		
		self.container = ColorContainer(firstElem: colorsArray2, secondElem: colorsArray1)
		customTableView.pupulate(with: container!)
		customTableView.reloadData()
	}
}

extension SecondaryViewController {
	func customiseButtontRiempimento() {
		self.buttonRiempimento.layer.cornerRadius = 10.0
	}
}
