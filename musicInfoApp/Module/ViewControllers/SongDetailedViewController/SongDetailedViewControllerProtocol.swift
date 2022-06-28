//
//  SongDetailedViewControllerProtocol.swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 28.06.2022.
//

import UIKit

protocol SongDetailedViewControllerProtocol {
    func getSong() -> Song?
    func setSong(song: Song)
    var delegate: SongDetailedViewControllerDelegate? { set get }
    var countSong: Int { get }
}
