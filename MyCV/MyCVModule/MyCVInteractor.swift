//
//  MyCVInteractor.swift
//  MyCV
//
//  Created by Marco Espinal on 01/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

protocol CVInteractableUseCase {
	func getMyCVInfo(completionHandler:@escaping (CVInfoModelResponse)-> Void) // aqui retornar el modelo de mi información
}

class MyCVInteractor{
	private let cvService = MyCVService.shared
}

extension MyCVInteractor: CVInteractableUseCase{
	func getMyCVInfo(completionHandler: @escaping (CVInfoModelResponse) -> Void) {
		cvService.requestCVInformation { (infoModel) in
			completionHandler(infoModel)
		}
	}
}
