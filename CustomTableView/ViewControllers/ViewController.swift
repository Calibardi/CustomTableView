//
//  ViewController.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 13/04/21.
//

import UIKit


class ViewController: UIViewController {
	
	@IBOutlet weak var progressViewRandom: UIProgressView!
	@IBOutlet weak var buttonProgressReset: UIButton!
	@IBOutlet weak var buttonTestDeinit: UIButton!
	@IBOutlet weak var customTableView: UITableView!
	
	let alertControllerForButton: UIAlertController = UIAlertController()
	let alertControllerForProgressView: UIAlertController = UIAlertController()
	
	let progress = Progress(totalUnitCount: 10)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Custom Table View"
		
		customiseDeinitBtn()
		customiseResetProgressButton()
		customiseProgressView()
		
		self.customTableView.delegate = self
		self.customTableView.dataSource = self
	}
	
	deinit {
		debugPrintString("Deinit called on main view controller!")
	}
	
	@IBAction func resetProgressView(_ sender: Any) {
		
		self.progress.completedUnitCount = 0
		self.progressViewRandom.setProgress(Float(self.progress.fractionCompleted), animated: true)
	}
	
	
	
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
			return UITableViewCell()
		}
		
		switch indexPath.row {
		case 0:
			cell.managedObjectsArray = colorsArray1
			cell.delegate = self
		case 1:
			cell.managedObjectsArray = colorsArray2
			cell.delegate = self
		default:
			return cell
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 120
	}
}

//MARK: - Customizzazione progress e buttons
extension ViewController {
	func customiseDeinitBtn() {
		self.buttonTestDeinit.layer.cornerRadius = 10.0
	}
	
	func customiseProgressView() {
		progressViewRandom.transform = progressViewRandom.transform.scaledBy(x: 1, y: 3)
		progressViewRandom.layer.cornerRadius = 10
	}
	
	func customiseResetProgressButton() {
		self.buttonProgressReset.layer.cornerRadius = 10.0
	}
}

//MARK: - Delegate ad-hoc
extension ViewController: TouchInCollectionCellDelegate {
	
	func showAlertAfterTouchOnButton(managedColor: ManagedColor) {
		
		alertControllerForButton.title = managedColor.name
		alertControllerForButton.message = "Un semplice colore"
		
		if alertControllerForButton.actions.isEmpty {
			alertControllerForButton.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
				NSLog("The \"OK\" alert occured on alertControllerForButton.")
			}))
		}
		
		self.present(alertControllerForButton, animated: true, completion: nil)
	}
	
	func userDidTapInCellToIncreaseProgress() {
		
		guard self.progress.isFinished == false else {
			debugPrintString("Progresso saturo: resetta")
			self.progressViewBecameSaturated()
			return
		}
		
		self.progress.completedUnitCount += 1
		self.progressViewRandom.setProgress(Float(self.progress.fractionCompleted), animated: true)
		
	}
	
	func progressViewBecameSaturated() {
		alertControllerForProgressView.message = "Prova a resettare il progresso!"
		
		if alertControllerForProgressView.actions.isEmpty {
			alertControllerForProgressView.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
				NSLog("The \"OK\" alert occured for alertControllerForProgressView.")
			}))
		}
		
		self.present(alertControllerForProgressView, animated: true, completion: nil)
	}
}
