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

		if let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceIdentifier", for: indexPath) as? CVTableViewCell{
			if let row = section?.rows[indexPath.row]{
				cell.setup(row: row)
				return cell
			}
		}
		return UITableViewCell()
	}
}
