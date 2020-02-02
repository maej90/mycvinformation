//
//  TableViewDataModel.swift
//  MyCV
//
//  Created by Marco Espinal on 02/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import Foundation

protocol Row {}

struct MyCVDataSource{
	let sections:[CVSection]
}

struct CVSection{
	let sectionTitle:String
	let rows:[Row]
}
