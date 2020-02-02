//
//  TableViewDataModel.swift
//  MyCV
//
//  Created by Marco Espinal on 02/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import Foundation

protocol Row {}

enum Section{
	case experience
	case education
	case certificate
	case interest
	case skills
	case personalInformation
	case languagues
}

struct MyCVDataSource{
	let sections:[CVSection]
}

struct CVSection{
	let section:Section
	let sectionTitle:String
	let rows:[Row]
}
