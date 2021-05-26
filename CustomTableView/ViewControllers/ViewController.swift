//
//  ViewController.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 13/04/21.
//

import UIKit


class ViewController: UIViewController {
	
	@IBOutlet private var progressViewRandom: UIProgressView?
	@IBOutlet private var buttonProgressReset: UIButton?
	@IBOutlet private var customTableView: UITableView?
	@IBOutlet weak var buttonGoToCollectionView: UIButton!
	
    private var alertControllerForButton: UIAlertController? = UIAlertController()
	private var alertControllerForProgressView: UIAlertController? = UIAlertController()
	
	private var progress = Progress(totalUnitCount: 10)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Main View Controller"
		
		customiseGoToBtn()
		customiseResetProgressButton()
		customiseProgressView()
		
        self.customTableView?.delegate = self
        self.customTableView?.dataSource = self
	}
	
	deinit {
		debugPrintString("Deinit called on main view controller!")
        
        self.alertControllerForButton = nil
        self.alertControllerForProgressView = nil
	}
	
	@IBAction private func resetProgressView(_ sender: Any) {
		
		self.progress.completedUnitCount = 0
        self.progressViewRandom?.setProgress(Float(self.progress.fractionCompleted), animated: true)
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
            cell.populateCell(objectsArray: colorsArray1)
            cell.delegate = self
        case 1:
            cell.populateCell(objectsArray: colorsArray2)
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
	private func customiseGoToBtn() {
        self.buttonGoToCollectionView?.layer.cornerRadius = 10.0
	}
	
	private func customiseProgressView() {
        progressViewRandom?.transform = progressViewRandom?.transform.scaledBy(x: 1, y: 3) ?? CGAffineTransform()
        progressViewRandom?.layer.cornerRadius = 10
	}
	
	private func customiseResetProgressButton() {
        self.buttonProgressReset?.layer.cornerRadius = 10.0
	}
}

//MARK: - Delegate ad-hoc
extension ViewController: TouchInCollectionCellDelegate {
	
    func showAlertAfterTouchOnButton(managedColor: ManagedColor) {
		
        alertControllerForButton?.title = managedColor.name
        alertControllerForButton?.message = "Un semplice colore"
		
        if alertControllerForButton?.actions.isEmpty ?? false {
            alertControllerForButton?.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
				NSLog("The \"OK\" alert occured on alertControllerForButton.")
			}))
		}
		
        self.present(alertControllerForButton ?? UIAlertController(), animated: true, completion: nil)
	}
	
	func userDidTapInCellToIncreaseProgress() {
		
		guard self.progress.isFinished == false else {
			debugPrintString("Progresso saturo: resetta")
			self.progressViewBecameSaturated()
			return
		}
		
		self.progress.completedUnitCount += 1
        self.progressViewRandom?.setProgress(Float(self.progress.fractionCompleted), animated: true)
		
	}
	
	func progressViewBecameSaturated() {
        alertControllerForProgressView?.message = "Prova a resettare il progresso!"
		
        if alertControllerForProgressView?.actions.isEmpty ?? false{
            alertControllerForProgressView?.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
				NSLog("The \"OK\" alert occured for alertControllerForProgressView.")
			}))
		}
		
        self.present(alertControllerForProgressView ?? UIAlertController(), animated: true, completion: nil)
	}
}
