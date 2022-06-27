//
//  SearchTableViewCell.swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 24.06.2022.
//

import UIKit

final class SearchTableViewCell: UITableViewCell {
    
    //MARK: - Size
    enum SizeforElement: Float {
        case sizeForCornerRadius = 10
    }

    //MARK: - outlet
    static let indentifier: String = "SearchTableViewCell"
    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var colectionName: UILabel!
    
    //MARK: - Variables
    private var imageDownLoadService = ImageDownloadService()
    
    //MARK: - model
    private var song: Song! = nil {
        didSet {
            self.trackName.text = song?.trackName
            self.artistName.text = song?.artistName
            self.colectionName.text = song?.collectionName
            downLoadImage(url: song.artworkUrl100)
        }
    }
    
    //MARK: - method
    override func prepareForReuse() {
        trackImage.image = nil
    }
    
    func setter(song: Song) {
        self.song = song
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.imageViewStyle()
    }
    
    private func imageViewStyle() {
        self.trackImage.layer.cornerRadius = CGFloat(SizeforElement.sizeForCornerRadius.rawValue)
    }
}

//MARK: - Extension imageDownLoadService
extension SearchTableViewCell {
    private func downLoadImage(url: URL?) {
        guard let url = url else  {
            return
        }
        
        imageDownLoadService.downLoadImage(url: url) { [weak self] downLoadImages in
            self?.trackImage.image = downLoadImages
        }
    }
}
