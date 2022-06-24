//
//  API.swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 24.06.2022.
//

import UIKit

final class API {
    static var shared: API = API()
    
    //MARK: Property
    private let host = "https://itunes.apple.com/search?term="
    //let song = Song()
    
    //MARK: Method
    func getUrlWithSearchStr(str: String) -> String {
        let rightStr = str.replacingOccurrences(of: " ", with: "+").lowercased()
        return host + "\(rightStr)" + "&entity=musicTrack"
    }
}
