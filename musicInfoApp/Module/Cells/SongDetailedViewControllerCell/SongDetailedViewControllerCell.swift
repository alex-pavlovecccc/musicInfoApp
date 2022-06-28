//
//  SongDetailedViewControllerCell.swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 27.06.2022.
//

import UIKit

class SongDetailedViewControllerCell: UITableViewCell {

    //MARK: - Property
    private var downLoadImageService = ImageDownloadService()
    
    //MARK: - Outlet
    @IBOutlet private weak var trackName: UILabel!
    @IBOutlet private weak var artistName: UILabel!
    @IBOutlet private weak var genre: UILabel!
    @IBOutlet private weak var duration: UILabel!
    @IBOutlet private weak var collectionName: UILabel!
    
    //MARK: - Variables
    private var song: Song? {
        didSet{
            self.trackName.text = song?.trackName
            self.artistName.text = song?.artistName
            self.genre.text = song?.primaryGenreName
            self.duration.text = "\((song?.trackTimeMillis ?? 0) / 60000) min"
            self.collectionName.text = song?.collectionName
        }
    }

    //MARK: - setter
    func setInfo(model: Song) {
        self.song = model
    }
}
