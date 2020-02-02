//
//  MyCVService.swift
//  MyCV
//
//  Created by Marco Espinal on 01/02/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import Foundation

struct ApplicationURL{
	static let cvInformationURL = "https://gist.githubusercontent.com/maej90/0b4b38bec4e79880d371b0cd3400d554/raw/b09cca08ca24600e0d3ba0f0dff8f3688a310ba7/MarcoEspinalCV.json"
}

struct CVInfoModelResponse{
	let info:CVInfoModel?
	let message:String
}


class MyCVService{
	
	//Singleton Pattern
	static let shared = MyCVService()
	// Lets make init function inaccessible
	private init(){}
	
	func requestCVInformation(completion: @escaping (CVInfoModelResponse) -> Void){
		
		ServiceConnection.shared.request(url: ApplicationURL.cvInformationURL) { (data, error) in
			
			if let error = error{
				completion(CVInfoModelResponse(info: nil, message: error.localizedDescription))
				return
			}
			
			if let data = data{
				do{
					let json = try JSONDecoder().decode(CVInfoModel.self, from: data)
					completion(CVInfoModelResponse(info: json, message: ""))
				}catch let error{
					completion(CVInfoModelResponse(info: nil, message: error.localizedDescription))
				}
			}
		}
	}
	
}
