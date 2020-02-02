//
//  MyCVViewController+DataSource.swift
//  MyCV
//
//  Created by Marco Espinal on 02/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import UIKit

extension MyCVViewController:UITableViewDataSource{
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return self.presenter.numberOfSections()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.presenter.numberOfRowsInSection(section: section)
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let section = self.presenter.section(atIndex: indexPath.section)

		if let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceIdentifier", for: indexPath) as? ExperienceTableViewCell{
						if let row = section?.rows[indexPath.row]{
							cell.setup(row: row)
							return cell
						}
		//				if let experience = section?.rows[indexPath.row] as? Work{
		//					cell.setup(period: experience.period, position: experience.position, company: experience.company, acomplishments: experience.accomplishments)
		//					return cell
		//				}
					}
		
//		if indexPath.section == 0{
//			//Experience
//			if let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceIdentifier", for: indexPath) as? ExperienceTableViewCell{
//				if let row = section?.rows[indexPath.row]{
//					cell.setup(row: row)
//					return cell
//				}
////				if let experience = section?.rows[indexPath.row] as? Work{
////					cell.setup(period: experience.period, position: experience.position, company: experience.company, acomplishments: experience.accomplishments)
////					return cell
////				}
//			}
//		}
//		else{
//			let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//			cell.textLabel?.text = "HOLA MUNdo"
//			return cell
//		}
		return UITableViewCell()
	}
}
