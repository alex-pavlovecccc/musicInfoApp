//
//  ImageAndButtonsDetailCell.swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 28.06.2022.
//

import UIKit
import AVFoundation
import AVKit

class ImageAndButtonsDetailCell: UITableViewCell {
    
    //MARK: - constant
    private let cornerRadiusForButton: CGFloat = 25
    private let imageSizeScale: CGFloat = 0.85
    
    //MARK: - Outlet
    @IBOutlet private weak var collectionImage: UIImageView!
    @IBOutlet private weak var playButton: UIButton!
    
    //MARK: - property
    private var model: Song? {
        didSet {
            loadImage(url: model?.artworkUrl100)
            self.audioURL = URL(string: model?.previewUrl ?? "")
        }
    }
    
    private var downLoadImage = ImageDownloadService()
    
    //MARK: - play song
    private lazy var player = AVPlayer()
    private var audioURL: URL?
    
    //MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setButtonStyle()
        self.setImageStyle()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(closeButtonDidTap),
                                               name: SongDetailedViewController.cancelButtonDidTapNotification,
                                               object: nil)
    }
    
    //MARK: - Method
    func setter(model: Song) {
        self.model = model
    }
    
    @IBAction private func likebuttonDidTap() {
        //MARK: TO-DO coreData service
    }
    
    private func setButtonStyle() {
        self.playButton.layer.cornerRadius = self.playButton.frame.height / 2
        self.playButton.addTarget(self, action: #selector(playButtonDidTap), for: .touchUpInside)
    }
    
    private func setImageStyle() {
        self.collectionImage.layer.cornerRadius = self.cornerRadiusForButton
        self.collectionImage.transform = CGAffineTransform(scaleX: imageSizeScale, y: imageSizeScale)
        self.collectionImage.layer.borderWidth = 0.2
        self.collectionImage.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.6)
    }
    
    //MARK: - Action
    @objc func playButtonDidTap(_ sender: UIButton) {
        
        guard let audioURL = audioURL else {return}
        
        if !playButton.isSelected == true {
            let avPlayerItem = AVPlayerItem(url: audioURL)
            self.player.replaceCurrentItem(with: avPlayerItem)
            self.playTrackAnimation()
            player.play()
        } else {
            player.pause()
            self.stopTrackAnimation()
        }
        playButton.isSelected = !playButton.isSelected
    }
    
   @objc private func closeButtonDidTap() {
        self.player.pause()
        self.audioURL = nil
    }
    
    //MARK: Animation method
    private func playTrackAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.collectionImage.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
    private func stopTrackAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.collectionImage.transform = CGAffineTransform(scaleX: self.imageSizeScale, y: self.imageSizeScale)
        }, completion: nil)
    }
}

//MARK: - extension ImageDownloadService
extension ImageAndButtonsDetailCell{
    private func loadImage(url: URL?){
        guard let url = url else {
            return
        }
        
        downLoadImage.downLoadImage(url: url) { [weak self] networkImage in
            self?.collectionImage.image = networkImage
        }
    }
}
