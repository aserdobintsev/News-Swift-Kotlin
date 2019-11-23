//
// ArticlesAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import Alamofire



open class ArticlesAPI {
    /**
     News List
     
     - parameter q: (query) Theme of news 
     - parameter from: (query) Date 
     - parameter sortBy: (query) Sort 
     - parameter apiKey: (query) API key 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func everythingGet(q: String, from: String, sortBy: String, apiKey: String, completion: @escaping ((_ data: ArticleList?,_ error: Error?) -> Void)) {
        everythingGetWithRequestBuilder(q: q, from: from, sortBy: sortBy, apiKey: apiKey).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     News List
     - GET /everything
     - parameter q: (query) Theme of news 
     - parameter from: (query) Date 
     - parameter sortBy: (query) Sort 
     - parameter apiKey: (query) API key 
     - returns: RequestBuilder<ArticleList> 
     */
    open class func everythingGetWithRequestBuilder(q: String, from: String, sortBy: String, apiKey: String) -> RequestBuilder<ArticleList> {
        let path = "/everything"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "q": q, 
            "from": from, 
            "sortBy": sortBy, 
            "apiKey": apiKey
        ])

        let requestBuilder: RequestBuilder<ArticleList>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}