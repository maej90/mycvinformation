//
//  MyCVViewController+TableViewDelegate.swift
//  MyCV
//
//  Created by Marco Espinal on 02/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import UIKit

extension MyCVViewController:UITableViewDelegate{

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		guard let section = self.presenter.section(atIndex: section) else { return nil }
		let view = SectionView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
		view.updateTitle(title: section.sectionTitle)
		return view
	}
	
}
