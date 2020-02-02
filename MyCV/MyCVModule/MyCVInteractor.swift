//
//  MyCVInteractor.swift
//  MyCV
//
//  Created by Marco Espinal on 01/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

protocol CVInteractableUseCase {
	func getMyCVInfo() -> String // aqui retornar el modelo de mi información
}

class MyCVInteractor{
	
	
}

extension MyCVInteractor: CVInteractableUseCase{
	func getMyCVInfo() -> String {
		return "MYCVINFORMATion"
	}
}
