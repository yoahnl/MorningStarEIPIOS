//
//  ApiProtocol.swift
//  MorningStar
//
//  Created by Guillaume Djaider Fornari on 12/12/2019.
//  Copyright © 2019 Yoahn Linard. All rights reserved.
//

import Foundation

protocol DataJSON: Codable {}

protocol ApiProtocol: class {
    var session: URLSession { get set }
    var url: String { set get }
    var request: URLRequest! { set get }
    var task: URLSessionDataTask? { get set }
    func createUrl() -> Void
    func newRequestPost(json: [String: String], completionHandler: @escaping (Bool, DataJSON?) -> Void)
    func getResponseJSON(data: Data, completionHandler: @escaping (Bool, DataJSON?) -> Void)
}

extension ApiProtocol {
    
    func newRequestPost(json: [String: String], completionHandler: @escaping (Bool, DataJSON?) -> Void) {
        self.createUrl()
        guard let url = URL(string: self.url) else {
            completionHandler(false, nil)
            return NotificationCenter.default.post(name: .error, object: ["Error Url", "Can't construct URL"])
        }
        self.request = URLRequest(url: url)
        self.request.httpMethod = "POST"
        self.request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        self.request.httpBody = jsonData
        self.getData() { success, data in
            completionHandler(success, data)
        }
    }
    
    func getData(completionHandler: @escaping (Bool, DataJSON?) -> Void) {
        self.task = self.session.dataTask(with: self.request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completionHandler(false, nil)
                    return NotificationCenter.default.post(name: .error, object: ["Error Data", "Can't recover Data from Api"])
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 201 else {
                    completionHandler(false, nil)
                    return NotificationCenter.default.post(name: .error, object: ["Error Response", "Error Access from Api"])
                }
                self.getResponseJSON(data: data) { success, data in
                    completionHandler(success, data)
                    return
                }
            }
        }
        self.task?.resume()
    }
}
