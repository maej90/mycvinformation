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
	
	init(view: MyCVView, interactor: CVInteractableUseCase, router:CVRouting) {
		self.view = view
		self.interactor = interactor
		self.router = router
	}
}

extension MyCVPresenter: CVPresentation{
	func viewDidLoad() {
		let myCVInformation = self.interactor.getMyCVInfo()// aqui se obtiene la informacion del servidor
		DispatchQueue.main.async { [weak self] in
			guard let self  = self else { return }
			self.view?.updateCVInformation(myCVInfo: myCVInformation)
		}
	}
}
