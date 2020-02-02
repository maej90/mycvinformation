//
//  MyCVInteractor.swift
//  MyCV
//
//  Created by Marco Espinal on 01/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

protocol CVUseCase {
	func fetchCVData() -> Void
}

class MyCVInteractor{
	private let cvService = MyCVService.shared
	weak var presentationDelegate:CVPresentationDelegate?
}

extension MyCVInteractor: CVUseCase{
	
	func fetchCVData(){
		cvService.requestCVInformation { [weak self] (infoModel) in
			guard let welf = self else {return}
			//aqui va la respuesta al presenter
			if let model = infoModel.info {
				welf.presentationDelegate?.onCVDataFetched(fetchedData: model)
			}
			else{
				welf.presentationDelegate?.onCVDataFetchedFailed(message:infoModel.message)
			}
		}
	}
}
