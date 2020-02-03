//
//  HeaderView.swift
//  MyCV
//
//  Created by Marco Espinal on 01/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import UIKit

struct Header{
	let name:String
	let position:String
	let resume:String
}

protocol HeaderViewable {
	func updateView() -> Void
}

class HeaderView: UIView {

	private lazy var avatarImageView:UIImageView = {
		let imageView = UIImageView()
		imageView.clipsToBounds = true
		imageView.contentMode = .scaleToFill
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private lazy var resumeLabel:UILabel = {
		let label = UILabel()
		label.textColor = .white
		label.font = UIFont.systemFont(ofSize: 14)
		label.numberOfLines = 0
		label.sizeToFit()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var myNameLabel:UILabel = {
		let label = UILabel()
		label.textColor = .white
		label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
		label.textAlignment = .left
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	private lazy var myCurrentPositionLabel:UILabel = {
		let label = UILabel()
		label.textColor = .white
		label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
		label.textAlignment = .left
		label.translatesAutoresizingMaskIntoConstraints = false
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
		backgroundColor = .black
		addSubview(avatarImageView)
		addSubview(myNameLabel)
		addSubview(myCurrentPositionLabel)
		addSubview(resumeLabel)
		setupLayout()
	}
	
	private func setupLayout(){
		NSLayoutConstraint.activate([
		//pin avatar to superview
			avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
			avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			avatarImageView.widthAnchor.constraint(equalToConstant: 100),
			avatarImageView.heightAnchor.constraint(equalToConstant: 100),
		//pin name to superview
			myNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
			myNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12),
			myNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			myNameLabel.heightAnchor.constraint(equalToConstant: 30),
			myNameLabel.bottomAnchor.constraint(equalTo: myCurrentPositionLabel.topAnchor),
		// pin position to superview
			myCurrentPositionLabel.topAnchor.constraint(equalTo: myNameLabel.bottomAnchor, constant: 8),
			myCurrentPositionLabel.leadingAnchor.constraint(equalTo: myNameLabel.leadingAnchor),
			myCurrentPositionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			myCurrentPositionLabel.heightAnchor.constraint(equalToConstant: 20),
			myCurrentPositionLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
		// pin resume to superview
			resumeLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
			resumeLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
			resumeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			resumeLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
		
	}
	
	override class var requiresConstraintBasedLayout: Bool{
		return true
	}
	
	func update(headerInfo:Header){
		self.myNameLabel.text = headerInfo.name
		self.myCurrentPositionLabel.text = headerInfo.position
		self.avatarImageView.image = UIImage(named: "avatar.jpg")
		self.resumeLabel.text = headerInfo.resume
	}
	
}

extension HeaderView: HeaderViewable{
	func updateView() {
		
	}
}
