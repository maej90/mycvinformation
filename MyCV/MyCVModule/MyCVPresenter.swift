//
//  MyCVPresenter.swift
//  MyCV
//
//  Created by Marco Espinal on 01/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import Foundation

protocol CVPresentation {
	func viewDidLoad() -> Void
}

class MyCVPresenter{
	
	private weak var view:MyCVView?
	private var interactor: CVInteractableUseCase
	private var router:CVRouting
	private var cvInfo:CVInfoModel?
	
	init(view: MyCVView, interactor: CVInteractableUseCase, router:CVRouting) {
		self.view = view
		self.interactor = interactor
		self.router = router
	}
}

extension MyCVPresenter: CVPresentation{
	func viewDidLoad() {
		self.interactor.getMyCVInfo { [weak self] (infoModel) in
			DispatchQueue.main.async {
				if let cv = infoModel.info{
					self?.cvInfo = cv
				}
				else{
					self?.view?.showErrorMessage(message: infoModel.message)
				}
			}
		}
	}
}
