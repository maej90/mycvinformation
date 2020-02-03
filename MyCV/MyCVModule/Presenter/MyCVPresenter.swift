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

protocol CVPresentationDataSource{
	func numberOfSections() -> Int
	func numberOfRowsInSection(section:Int) -> Int
	func section(atIndex index: Int) -> CVSection?
	func headerInfo() -> Header
}

protocol CVPresentation:CVPresentationDataSource {
	func viewWillAppear() -> Void
	func tableViewDidSelect(at indexPath:IndexPath) -> Void
}

extension String:Row{}

class MyCVPresenter{
	
	private weak var view:MyCVView?
	private var interactor: CVUseCase
	private var router:CVRouting
	
	//Table view datasource
	private var dataSource:MyCVDataSource?
	var header:Header?
	
	init(view: MyCVView, interactor: CVUseCase, router:CVRouting) {
		self.view = view
		self.interactor = interactor
		self.router = router
	}
	
	private func getTableViewDataSource(from infoModel:CVInfoModel) {
		
		var sections:[CVSection] = [CVSection]()
		
		sections.append(CVSection(section: .experience, sectionTitle: "Experience", rows: infoModel.work))
		sections.append(CVSection(section: .education, sectionTitle: "Education", rows: [infoModel.education]))
		sections.append(CVSection(section: .certificate, sectionTitle: "Certificates", rows: infoModel.certificates))
		sections.append(CVSection(section: .interest, sectionTitle: "Interests", rows: infoModel.interests))
		sections.append(CVSection(section: .personalInformation, sectionTitle: "Personal Information", rows: infoModel.personalInfo))
		sections.append(CVSection(section: .skills, sectionTitle: "Skills", rows: infoModel.skills))
		sections.append(CVSection(section: .languagues, sectionTitle: "Languagues", rows: infoModel.languages))
		
		dataSource = MyCVDataSource(sections: sections)
		header = Header(name: infoModel.name, position: infoModel.currentPosition, resume: infoModel.resume)
		
	}
	
}

extension MyCVPresenter: CVPresentation{
	func tableViewDidSelect(at indexPath: IndexPath) {
		guard let section = self.dataSource?.sections[indexPath.section] as? CVSection else {return}
		let row = section.rows[indexPath.row]
	}
	
	func viewWillAppear() {
		self.interactor.fetchCVData()
	}

}

extension MyCVPresenter: CVPresentationDataSource{
	func headerInfo() -> Header {
		return self.header ?? Header(name: "", position: "", resume: "")
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
