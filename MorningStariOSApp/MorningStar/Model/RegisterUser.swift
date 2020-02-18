//
//  RegisterUser.swift
//  MorningStar
//
//  Created by Guillaume Djaider Fornari on 12/12/2019.
//  Copyright © 2019 Yoahn Linard. All rights reserved.
//

import Foundation

struct NewAccount: DataJSON {
    let username: String
    let email: String
    let createdAt: String
    let sessionToken: String
    let updatedAt:String
    let objectId: String
}

class RegisterUser: ApiProtocol {
    var session: URLSession = URLSession(configuration: .default)
    var url: String = ""
    var request: URLRequest!
    var task: URLSessionDataTask?
    
    func createUrl() {
        self.url = "http://localhost:8000/auth/register"
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
