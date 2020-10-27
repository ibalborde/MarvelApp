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
    
    
    func getCharactersData(completion: @escaping([CharacterData]?) -> ()) {
        let endpoint = "\(ConstantsAPI.getCharacters)"
        let parameters = ["apikey": ConstantsMarvel.publicKeyMarvel, "hash": ConstantsMarvel.hashMarvel, "ts":1] as [String : Any]
        AF.request(endpoint, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .validate(contentType: ["application/json"])
            .response {
            (resposeData) in
            guard let data = resposeData.data else {
                completion(nil)
                return }
            do {
                let characters = try JSONDecoder().decode(Data.self, from: data)
                completion(characters.data?.results)
            } catch {
                print("Error: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }

}
