//
//  NetworkService .swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 24.06.2022.
//

import UIKit

class NetworkService {
    var api = API()

    //MARK: - Method
    func getResult (searchString: String, complition: @escaping(Result<[Song],NetworkError>)-> Void) {
        
    }
    
    private func taskWithUrl<T: Codable>(model: T.Type, url: String, complition: @escaping(Result<[Song], NetworkError>)-> Void) {
        
    }
    
    //MARK: - network error
    enum NetworkError: Error {
        case abracadabra
        case URLError
        case invalidResponse
        case invalidData
        case invalidSongs
        case error(error: String)
        case decodingError
    }
}
