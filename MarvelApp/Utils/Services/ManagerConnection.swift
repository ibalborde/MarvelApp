//
//  APIRequest.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 27/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import Foundation
import Alamofire

class ManagerConnection {
    
    func getCharactersData(ofset: Int,completion: @escaping([Character]?) -> ()) {
        let endpoint = "\(ConstantsAPI.getCharacters)"
        let parameters: [String : Any] = [ "limit": 15,
                                           "offset": ofset,
                                           "apikey": ConstantsMarvel.publicKeyMarvel,
                                           "hash": ConstantsMarvel.hashMarvel,
                                           "ts":1 ]
        
        performGetRequest(endpoint: endpoint, params: parameters, resultType: CharactersData.self) { result in
            completion(result?.data?.results)
        }
    }
    func getEvetsData(ofset: Int,completion: @escaping([ComicEvent]?) -> ()) {
        let endpoint = "\(ConstantsAPI.getEvents)"
        let parameters: [String : Any] = [
            "apikey": ConstantsMarvel.publicKeyMarvel,
            "hash": ConstantsMarvel.hashMarvel,
            "ts":1 ]
        
        performGetRequest(endpoint: endpoint, params: parameters, resultType: ComicEventsData.self) { result in
            completion(result?.data?.results)
        }
    }
    
    private func performGetRequest<Result:Codable>(endpoint: String, params: [String: Any], resultType: Result.Type, completion: @escaping(Result?)->()) {
           AF.request(endpoint, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil, interceptor: nil)
               .validate(contentType: ["application/json"])
               .response { resposeData in
                   if case .failure(_) = resposeData.result {
                       completion(nil)
                       return
                   }
                   guard let data = resposeData.data else {
                       completion(nil)
                       return
                   }
                   do {
                       let resultValue = try JSONDecoder().decode(Result.self, from: data)
                       completion(resultValue)
                   } catch {
                       print("Error: \(error.localizedDescription)")
                       completion(nil)
                   }
           }
       }
    
}
