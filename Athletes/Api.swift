//
//  Api.swift
//  Athletes
//
//  Created by Michael Slattery on 10/17/20.
//

import Foundation

enum Endpoints {
    case athletes
    case squads
    case session
    
    func url() -> URL {
        let baseUrl: String
        let path: String
        
        switch self {
        case .athletes: path = "/athletes"
        case .squads: path = "/squads"
        case .session: path = "/session"
        }
        
        baseUrl = Api.shared.baseUrl
        
        return URL(string: baseUrl + path)!
    }
}

class Api {
    
    private init() {}
    
    static let shared = Api()
    
    let baseUrl = "https://kml-tech-test.glitch.me"
    
    func login(username: String, password: String, completion: @escaping (Session?) -> ()) {
        let json: [String: Any] = ["username": username, "password": password]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        let url = Endpoints.session.url()
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        fetch(request: request, completion: completion)
    }
    
    func getAthletes(completion: @escaping (Athletes?) -> ()) {
        let url = Endpoints.athletes.url()
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        fetch(request: request, completion: completion)
    }
    
    func getSquads(completion: @escaping (Squads?) -> ()) {
        let url = Endpoints.squads.url()
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        fetch(request: request, completion: completion)
    }
    
    func getImage(url: URL, completion: @escaping (Data?) -> ()) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        fetch(request: request, completion: completion)
    }
    
    private func fetch<T: Codable>(request: URLRequest, completion: @escaping (T?) -> ()) {
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            self?.parse(data: data, completion: completion)
        }
        task.resume()
    }
    
    private func parse<T: Codable>(data: Data, completion: @escaping (T?) -> ()) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let decodedData = try decoder.decode(T.self, from: data)
            completion(decodedData)
        } catch let error {
            print(error)
            completion(nil)
        }
    }
}
