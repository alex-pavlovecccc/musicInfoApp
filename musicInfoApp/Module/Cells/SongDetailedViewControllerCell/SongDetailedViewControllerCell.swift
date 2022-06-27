//
//  SongDetailedViewControllerCell.swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 27.06.2022.
//

import UIKit

class SongDetailedViewControllerCell: UITableViewCell {

    //MARK: - Outlet
    @IBOutlet private weak var trackName: UILabel!
    @IBOutlet private weak var artistName: UILabel!
    @IBOutlet private weak var genre: UILabel!
    @IBOutlet private weak var duration: UILabel!
    
    //MARK: - Variables
    private var song: Song? {
        didSet{
            self.trackName.text = song?.trackName
            self.artistName.text = song?.artistName
            self.genre.text = song?.primaryGenreName
        }
    }
    
    //MARK: - life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK: - setter
    func setInfo(model: Song) {
        self.song = model
    }
}
