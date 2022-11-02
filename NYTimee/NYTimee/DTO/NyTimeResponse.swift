//
//  NyTimeResponse.swift
//  Limou Cloud
//
//  Created by developer on 18/05/2021.
//

import Foundation
struct NyTimeResponse : Codable {
    
	let status : String?
	let copyright : String?
	let numResults : Int?
	let results : [Results]?

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case copyright = "copyright"
		case numResults = "num_results"
		case results = "results"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        numResults = try values.decodeIfPresent(Int.self, forKey: .numResults)
		results = try values.decodeIfPresent([Results].self, forKey: .results)
	}
}
