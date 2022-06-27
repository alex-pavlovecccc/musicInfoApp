//
//  SongDetailedViewControllerViewModel.swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 28.06.2022.
//

import UIKit

final class SongDetailedViewControllerViewModel: NSObject, SongDetailedViewControllerProtocol {
  
    //MARK: - Property
    var delegate: SongDetailedViewControllerDelegate?
    
    var countSong: Int {
        return songs.count
    }
    
    //MARK: - Variables
    private var songs: [Song] = [] {
        didSet {
            delegate?.tableViewReloadData()
        }
    }
    //MARK: - Method
    func getSong(indexPath: IndexPath) -> Song {
        return songs[indexPath.row]
    }
    
    func setSong(song: Song) {
         self.songs.append(song)
    }
}
