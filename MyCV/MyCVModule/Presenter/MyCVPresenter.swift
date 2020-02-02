//
//  MyCVPresenter.swift
//  MyCV
//
//  Created by Marco Espinal on 01/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import Foundation

protocol CVPresentationDelegate: class{
	func onCVDataFetched(fetchedData:CVInfoModel) -> Void
	func onCVDataFetchedFailed(message:String) -> Void
}

protocol CVPresentation {
	func viewWillAppear() -> Void
	func numberOfSections() -> Int
	func numberOfRowsInSection(section:Int) -> Int
	func section(atIndex index: Int) -> CVSection?
}

extension String:Row{}

class MyCVPresenter{
	
	private weak var view:MyCVView?
	private var interactor: CVUseCase
	private var router:CVRouting
	
	//Table view datasource
	var dataSource:MyCVDataSource?
	
	init(view: MyCVView, interactor: CVUseCase, router:CVRouting) {
		self.view = view
		self.interactor = interactor
		self.router = router
	}
	
	private func getTableViewDataSource(from infoModel:CVInfoModel) {
		
		var sections:[CVSection] = [CVSection]()
		
		sections.append(CVSection(sectionTitle: "Experience", rows: infoModel.work))
		sections.append(CVSection(sectionTitle: "Education", rows: [infoModel.education]))
		sections.append(CVSection(sectionTitle: "Certificates", rows: infoModel.certificates))
		sections.append(CVSection(sectionTitle: "Interests", rows: infoModel.interests))
		sections.append(CVSection(sectionTitle: "Personal Information", rows: infoModel.personalInfo))
		sections.append(CVSection(sectionTitle: "Skills", rows: infoModel.skills))
		sections.append(CVSection(sectionTitle: "Languagues", rows: infoModel.languages))
		
		dataSource = MyCVDataSource(sections: sections)
	}
	
}

extension MyCVPresenter: CVPresentation{
	func viewWillAppear() {
		self.interactor.fetchCVData()
	}
	func numberOfSections() -> Int {
		guard let sections = self.dataSource?.sections else {return 0}
		return sections.count
	}
	func numberOfRowsInSection(section: Int) -> Int {
		guard let sections = self.dataSource?.sections else {return 0}
		return sections[section].rows.count
	}
	func section(atIndex index: Int) -> CVSection? {
		guard let sections = self.dataSource?.sections else {return nil}
		return sections[index]
	}
}

extension MyCVPresenter: CVPresentationDelegate{
	func onCVDataFetched(fetchedData: CVInfoModel) {
		self.getTableViewDataSource(from: fetchedData)
		DispatchQueue.main.async {
			self.view?.updateCVInformation()
		}
	}
	func onCVDataFetchedFailed(message: String) {
		DispatchQueue.main.async {
			self.view?.showErrorMessage(message: message)
		}
	}
}
