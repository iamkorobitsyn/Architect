//
//  CleanSwiftNetworkManager.swift
//  Architect
//
//  Created by Александр Коробицын on 20.11.2022.
//

import Foundation

enum CleanSwiftNetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class CleanSwiftNetworkManager {
    
    private init() {}
    
    static let instance = CleanSwiftNetworkManager()
    
    let api = "https://dummyjson.com/users"
    
    func fetchData <T: Decodable> (dataType: T.Type,
                                   url: String,
                                   completion: @escaping(Result <T, CleanSwiftNetworkError>) -> Void ) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "no error description")
                return
            }

            do {
                let objects = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(objects))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func fetchImage(url: String,
                    completion: @escaping(Result<Data, CleanSwiftNetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        DispatchQueue.global().async {
            guard let image = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(image))
            }
        }
    }
}
