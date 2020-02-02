//
//  ExperienceTableViewCell.swift
//  MyCV
//
//  Created by Marco Espinal on 02/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {

	@IBOutlet weak var periodLabel: UILabel!
	@IBOutlet weak var positionLabel: UILabel!
	@IBOutlet weak var companyLabel: UILabel!
	@IBOutlet weak var acomplishmentStackview: UIStackView!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	func setup(period:String, position:String, company:String, acomplishments:[String]){
		self.periodLabel.text = period
		self.positionLabel.text = position
		self.companyLabel.text = company
		
		for acomplishment in acomplishments{
			let label = UILabel()
			label.text = "* " + acomplishment
			label.textAlignment = .left
			label.font = UIFont.systemFont(ofSize: 14)
			label.numberOfLines = 0
			self.acomplishmentStackview.addArrangedSubview(label)
		}
		
	}
	
	
}
