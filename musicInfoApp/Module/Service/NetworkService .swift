//
//  NetworkService .swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 24.06.2022.
//

import UIKit

class NetworkService {
    
    private let api = API()

    //MARK: - Method
    func getResultWithSearchSrting(searchString: String, complition: @escaping(Result<[Song],NetworkError>)-> Void) {
        guard let url = URL(string: api.getUrlWithSearchStr(str: searchString)) else {
            DispatchQueue.main.async {
                complition(.failure(NetworkError.URLError))
            }
            return
        }
        
        taskWithUrl(model: SearchResponse.self, url: url) { result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    complition(.failure(error))
                }
                
            case .success(let songs):
                let songs = songs.results
                DispatchQueue.main.async {
                    complition(.success(songs))
                }
            }
        }
    }
    
    private func taskWithUrl<T: Codable>(model: T.Type, url: URL, complition: @escaping(Result<T, NetworkError>)-> Void) {
        
        URLSession.shared.dataTask(with: url) { data, dataResponse, error in
            do {
                guard error == nil else {
                    throw NetworkError.error
                }
                
                guard let response = dataResponse as? HTTPURLResponse, response.statusCode == 200 else {
                    throw NetworkError.invalidResponse
                }
                
                guard let data = data else {
                    throw NetworkError.invalidData
                }
                
                guard let songs = try? JSONDecoder().decode(model.self, from: data) else {
                    throw NetworkError.invalidSongs
                }
                
                DispatchQueue.main.async {
                    complition(.success(songs))
                }
                
            } catch {
                guard let error = error as? NetworkError else {
                    return
                }
                complition(.failure(error))
            }
        }.resume()
    }
    
    //MARK: - NetworkError
    enum NetworkError: Error {
        case abracadabra
        case URLError
        case invalidResponse
        case invalidData
        case invalidSongs
        case error
        case decodingError
    }
}
