//
//  HeaderView.swift
//  MyCV
//
//  Created by Marco Espinal on 01/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import UIKit

protocol HeaderViewable {
	func updateHeaderInformation()
	func moveAvatarWhenScrolling()
}

class HeaderView: UIView {

	private lazy var avatarImageView:UIImageView = {
		let imageView = UIImageView()
		let image = UIImage(named: "avatar.jpg")
		imageView.image = image
		imageView.clipsToBounds = true
		imageView.contentMode = .scaleToFill
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private lazy var resumeLabel:UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 12)
		label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
		label.numberOfLines = 0
		label.sizeToFit()
		label.contentMode = .topLeft
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var myNameLabel:UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
		label.text = "MARCO ESPINAL"
		label.textAlignment = .left
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	private lazy var myCurrentPositionLabel:UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
		label.text = "TECH LEADER"
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
		backgroundColor = .red
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
		// pin position to superview
			myCurrentPositionLabel.topAnchor.constraint(equalTo: myNameLabel.bottomAnchor, constant: 8),
			myCurrentPositionLabel.leadingAnchor.constraint(equalTo: myNameLabel.leadingAnchor),
			myCurrentPositionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			myCurrentPositionLabel.heightAnchor.constraint(equalToConstant: 20),
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
	
}

extension HeaderView: HeaderViewable{
	func moveAvatarWhenScrolling() {
	}
	func updateHeaderInformation() {
		
	}
}

//protocol HeaderPresentation {
//
//}
//
//class HeaderPresenter{
//
//}
//
//extension HeaderPresenter:HeaderPresentation{
//
//}
