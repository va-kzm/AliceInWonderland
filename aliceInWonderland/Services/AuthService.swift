//
//  AuthService.swift
//  aliceInWonderland
//
//  Created by Mokhamad Valid Kazimi on 27.03.2018.
//  Copyright © 2018 Mokhamad Valid Kazimi. All rights reserved.
//

import Foundation
import Alamofire

class AuthService {
    static let instance = AuthService()
    
    // Properties
    var accessToken: String = ""
    
    // Methods
    func signup(usingName name: String, andEmail email: String, andPassword password: String, completion: @escaping (_ completed: Bool) -> ()) {
        
        let body: [String: Any] = [
            "name": name,
            "email": email,
            "password": password
        ]
        
        Alamofire.request(SIGNUP_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).validate().responseJSON { (response) in
            switch response.result {
            case .success:
                guard let json = response.result.value as? [String: Any] else { return }
                
                let data = json["data"] as? [String: Any]
                let token = data!["access_token"] as? String
                self.accessToken = token!
                
                print(self.accessToken)
                
                completion(true)
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
    
    func login(usingEmail email: String, andPassword password: String, completion: @escaping (_ completed: Bool) -> ()) {
        
        let body: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        Alamofire.request(LOGIN_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).validate().responseJSON { (response) in
            switch response.result {
            case .success:
                guard let json = response.result.value as? [String: Any] else { return }
                
                let data = json["data"] as? [String: Any]
                let token = data!["access_token"] as? String
                self.accessToken = token!
                
                print(self.accessToken)
                
                completion(true)
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
    
    func fetchText(_ textData: @escaping (_ data: String) -> (), _ completion: @escaping (_ completed: Bool) -> ()) {
        Alamofire.request(GET_TEXT_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER).responseJSON { (response) in
            if response.result.error == nil {
                guard let json = response.result.value as? [String: Any] else { return }
                
                let data = json["data"] as? String
                
                print(data!)
                
                textData(data!)
                completion(true)
            } else {
                debugPrint(response.result.error!)
            }
        }
    }
}
