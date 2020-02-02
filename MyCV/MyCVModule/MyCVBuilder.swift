//
//  MyCVBuilder.swift
//  MyCV
//
//  Created by Marco Espinal on 01/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import UIKit

class MyCVBuilder{
	
	static func buildCV() -> UIViewController{
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let viewController = storyboard.instantiateViewController(identifier: "MyCVViewControllerIdentifier") as! MyCVViewController
		let interactor = MyCVInteractor()
		let router = MyCVRouter()
		let presenter = MyCVPresenter(view: viewController, interactor: interactor, router: router)
		viewController.presenter = presenter
		return viewController
	}
	
}

