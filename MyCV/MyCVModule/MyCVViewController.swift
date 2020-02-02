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
}

class MyCVViewController: UIViewController {
	@IBOutlet weak var myCVLabel: UILabel!
	
	var presenter:CVPresentation!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		self.presenter.viewDidLoad()
		// Do any additional setup after loading the view.
	}


}

extension MyCVViewController:MyCVView{
	func updateCVInformation(myCVInfo: String) {
		self.myCVLabel.text = myCVInfo
		print("Aqui se obtiene la informacion de mi cv\(myCVInfo)")
	}
}

