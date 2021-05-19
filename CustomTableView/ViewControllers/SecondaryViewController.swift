//
//  SecondaryViewController.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 19/05/21.
//

import UIKit

class SecondaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		title = "Deinit Test"
        // Do any additional setup after loading the view.
    }
    
	deinit {
		debugPrintString("Deinit called per la view secondaria")
	}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
