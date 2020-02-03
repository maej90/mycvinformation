//
//  CVTableViewCell.swift
//  MyCV
//
//  Created by Marco Espinal on 02/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import UIKit

class CVTableViewCell: UITableViewCell {

	@IBOutlet weak var periodLabel: UILabel!
	@IBOutlet weak var positionLabel: UILabel!
	@IBOutlet weak var companyLabel: UILabel!
	@IBOutlet weak var acomplishmentStackview: UIStackView!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	private func setup(){
		self.acomplishmentStackview.arrangedSubviews.forEach{ $0.removeFromSuperview() }
		self.periodLabel.sizeToFit()
		self.positionLabel.sizeToFit()
		self.companyLabel.sizeToFit()
	}
	
	func setup(row:Row){
		self.setup()
		if let experience = row as? Work{
			
			self.periodLabel.isHidden = false
			self.positionLabel.isHidden = false
			self.companyLabel.isHidden = false
			
			self.periodLabel.text = experience.period
			self.positionLabel.text = experience.position
			self.companyLabel.text = experience.company
			
			for acomplishment in experience.accomplishments{
				let label = UILabel()
				label.text = "* " + acomplishment
				label.textAlignment = .left
				label.font = UIFont.systemFont(ofSize: 14)
				label.numberOfLines = 0
				self.acomplishmentStackview.addArrangedSubview(label)
			}
		}else if let education = row as? Education{
			
			self.periodLabel.isHidden = false
			self.positionLabel.isHidden = false
			self.companyLabel.isHidden = true

			self.periodLabel.text = education.period
			self.positionLabel.text = education.name
			
			let label = UILabel()
			label.text = "* " + education.carrer
			label.textAlignment = .left
			label.font = UIFont.systemFont(ofSize: 14)
			label.numberOfLines = 0
			self.acomplishmentStackview.addArrangedSubview(label)
			
		}else if let certificate = row as? Certificate{
			self.periodLabel.isHidden = true
			self.positionLabel.isHidden = true
			self.companyLabel.isHidden = true
			
			let label = UILabel()
			label.text = "* " + certificate.name
			label.textAlignment = .left
			label.font = UIFont.systemFont(ofSize: 14)
			label.numberOfLines = 0
			self.acomplishmentStackview.addArrangedSubview(label)
		}
		else if let personalInfo = row as? PersonalInfo{
			self.periodLabel.isHidden = true
			self.positionLabel.isHidden = true
			self.companyLabel.isHidden = true
			let label = UILabel()
			label.text = "\(personalInfo.name): " + personalInfo.value
			label.textAlignment = .left
			label.font = UIFont.systemFont(ofSize: 14)
			label.numberOfLines = 0
			self.acomplishmentStackview.addArrangedSubview(label)
		}
		else if let str = row as? String{
			self.periodLabel.isHidden = true
			self.positionLabel.isHidden = true
			self.companyLabel.isHidden = true
			
			let label = UILabel()
			label.text = "* " + str
			label.textAlignment = .left
			label.font = UIFont.systemFont(ofSize: 14)
			label.numberOfLines = 0
			self.acomplishmentStackview.addArrangedSubview(label)
		}
	}
	
	
}
