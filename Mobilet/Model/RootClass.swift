//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct RootClass{

	var id : Int!
	var thumbnailUrl : String!
	var title : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		id = dictionary["id"] as? Int
		thumbnailUrl = dictionary["thumbnailUrl"] as? String
		title = dictionary["title"] as? String
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if id != nil{
			dictionary["id"] = id
		}
		if thumbnailUrl != nil{
			dictionary["thumbnailUrl"] = thumbnailUrl
		}
		if title != nil{
			dictionary["title"] = title
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

}