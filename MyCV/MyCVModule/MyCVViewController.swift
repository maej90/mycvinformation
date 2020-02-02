//
//  ViewController.swift
//  MyCV
//
//  Created by Marco Espinal on 31/01/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import UIKit

protocol MyCVView:class{
	func updateCVInformation(myCVInfo:String)
	func showErrorMessage(message:String)
}


class MyCVViewController: UITableViewController {
	@IBOutlet weak var myCVLabel: UILabel!
	
	var presenter:CVPresentation!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		self.presenter.viewDidLoad()
		// Do any additional setup after loading the view.
	}


}

extension MyCVViewController:MyCVView{
	func showErrorMessage(message: String) {
		let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: "OK", style: .default, handler: nil)
		alert.addAction(action)
		self.present(alert, animated: true, completion: nil)
	}
	
	func updateCVInformation(myCVInfo: String) {
		self.myCVLabel.text = myCVInfo
		print("Aqui se obtiene la informacion de mi cv\(myCVInfo)")
	}
}

