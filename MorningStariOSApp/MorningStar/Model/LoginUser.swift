//
//  LoginUser.swift
//  MorningStar
//
//  Created by Guillaume Djaider Fornari on 12/12/2019.
//  Copyright © 2019 Yoahn Linard. All rights reserved.
//

import Foundation

class LoginUser: ApiProtocol {
    var session: URLSession = URLSession(configuration: .default)
    var url: String = ""
    var request: URLRequest!
    var task: URLSessionDataTask?
    
    func createUrl() {
        self.url = "http://localhost:8000/auth/login"
    }
    
    func getResponseJSON(data: Data, completionHandler: @escaping (Bool, DataJSON?) -> Void) {
       do {
            let resultData: NewAccount = try JSONDecoder().decode(NewAccount.self, from: data)
            print(resultData)
            completionHandler(true, resultData)
        } catch {
            completionHandler(false, nil)
        }
    }
}
