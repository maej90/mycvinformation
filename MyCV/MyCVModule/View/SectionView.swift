//
//  SectionView.swift
//  MyCV
//
//  Created by Marco Espinal on 02/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import UIKit

protocol SectionViewable {
	func updateTitle(title:String) -> Void
}

class SectionView: UIView {
	
	private lazy var titleLabel:UILabel = {
		let label = UILabel()
		label.text = ""
		label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		label.textColor = .blue
		label.textAlignment = .left
		label.translatesAutoresizingMaskIntoConstraints = false
		label.sizeToFit()
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupView()
	}
	
	private func setupView(){
		backgroundColor = .white
		addSubview(titleLabel)
		setupLayout()
	}
	
	private func setupLayout(){
		NSLayoutConstraint.activate([
		//pin label to superview
			titleLabel.topAnchor.constraint(equalTo: topAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
	
}

extension SectionView:SectionViewable{
	func updateTitle(title: String) {
		self.titleLabel.text = title
	}
}
