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
	@IBOutlet weak var customTableView: CustomTableView!
	
	let alertControllerForButton: UIAlertController = UIAlertController()
	let alertControllerForProgressView: UIAlertController = UIAlertController()
	
	let progress = Progress(totalUnitCount: 10)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Custom Table View"
		let container: ColorContainer = ColorContainer(firstElem: colorsArray1, secondElem: colorsArray2)
		self.customTableView.container = container
		self.customTableView.alertDelegate = self
		
		customiseDeinitBtn()
		customiseResetProgressButton()
		customiseProgressView()
	}
	
	deinit {
		debugPrintString("Deinit called on main view controller!")
	}
	
	@IBAction func resetProgressView(_ sender: Any) {
		
		self.progress.completedUnitCount = 0
		self.progressViewRandom.setProgress(Float(self.progress.fractionCompleted), animated: true)
	}
	
}

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
