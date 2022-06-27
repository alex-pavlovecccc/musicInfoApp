//
//  SearchVCViewModel.swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 24.06.2022.
//

import UIKit

final class SearchVCViewModel: NSObject, SearchVCViewModelProtocol {
 
    //MARK: - property
    var songs: [Song] = [] {
        didSet{
            delegate?.tableViewReloadData()
        }
    }
    
    private var networkService = NetworkService()
    var delegate: SearchVCViewModelDelegate?
    
    //MARK: - protocol method
    var countSongs: Int  {
        return songs.count
    }
    
    func getSong(indexPath: IndexPath) -> Song {
        return songs[indexPath.row]
    }
    
    func getSongWithSearchString(str: String) {
        networkService.getResultWithSearchSrting(searchString: str) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let songs):
                self?.songs = songs
            }
        }
    }
}
