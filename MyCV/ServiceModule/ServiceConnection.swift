//
//  ServiceConnection.swift
//  MyCV
//
//  Created by Marco Espinal on 01/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import Foundation


class ServiceConnection{
	
	//Singleton pattern
	static let shared = ServiceConnection()
	
	private let defaultSession = URLSession(configuration: .default)
	private var dataTask:URLSessionDataTask?
//	typealias QueryResult = ([Track]?, String) -> Void
	typealias ServiceResult = (Data?, Error?) -> Void
	
	// Lets make init function inaccessible
	private init(){}
	
	func request(url:String, completion: @escaping ServiceResult) {
		
		//Cancel any task if there is one
		dataTask?.cancel()
		
		guard let url = URL(string: url) else {return}
		
		dataTask = defaultSession.dataTask(with: url, completionHandler: { [weak self] (data, response, error) in
			if let error = error{
				//handle error
				print(error.localizedDescription)
			}
			else if let data = data,
					let response = response as? HTTPURLResponse,
					response.statusCode == 200{
				self?.dataTask = nil
				completion(data,error)
			}
		})
		self.dataTask?.resume()
		
	}
	
}
