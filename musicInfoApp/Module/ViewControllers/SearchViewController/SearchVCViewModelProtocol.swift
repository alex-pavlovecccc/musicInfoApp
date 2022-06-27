//
//  SearchVCViewModelProtocol.swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 24.06.2022.
//

import UIKit

protocol SearchVCViewModelProtocol {
    var delegate: SearchVCViewModelDelegate? { set get }
    var countSongs: Int { get }
    func getSongWithSearchString(str: String)
    func getSong(indexPath: IndexPath) -> Song
}
