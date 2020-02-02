//
//  MyCVViewController+ScrollViewDelegate.swift
//  MyCV
//
//  Created by Marco Espinal on 02/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import UIKit

extension MyCVViewController:UIScrollViewDelegate{
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let y = -scrollView.contentOffset.y
		let height = max (y,100)
		headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: height)
	}
}
