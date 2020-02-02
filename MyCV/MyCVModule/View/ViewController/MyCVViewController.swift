//
//  ViewController.swift
//  MyCV
//
//  Created by Marco Espinal on 31/01/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import UIKit

protocol MyCVView:class{
	func updateCVInformation() -> Void
	func showErrorMessage(message:String)
}


class MyCVViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	var headerView:HeaderView!
	
	var presenter:CVPresentation!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.activityIndicator.startAnimating()
		//Register custom cells
		self.tableView.register(UINib(nibName: "ExperienceTableViewCell", bundle: nil), forCellReuseIdentifier: "ExperienceIdentifier")
		self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
		
		//Lets create and add the stretchy header
		headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 250))
		headerView.autoresizingMask = .flexibleWidth
		self.view.addSubview(headerView)
		
		//I set top inset to 200 so to have enough space for the stretchy header
		self.tableView.contentInset = UIEdgeInsets(top: 250, left: 0, bottom: 0, right: 0)
		self.tableView.estimatedRowHeight = 100
		self.tableView.rowHeight = UITableView.automaticDimension
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.presenter.viewWillAppear()
	}
	
}

// MARK: -

extension MyCVViewController: MyCVView{
	
	func updateCVInformation() {
		self.activityIndicator.stopAnimating()
		self.headerView.update(headerInfo: self.presenter.headerInfo())
		self.tableView.reloadData()
	}
	
	func showErrorMessage(message: String) {
		let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: "OK", style: .default, handler: nil)
		alert.addAction(action)
		self.present(alert, animated: true, completion: nil)
	}
	
}

