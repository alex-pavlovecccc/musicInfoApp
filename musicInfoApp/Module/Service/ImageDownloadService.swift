//
//  ImageDownloadService.swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 26.06.2022.
//

import UIKit

final class ImageDownloadService {
    
    private var download: DispatchWorkItem?
    
    func downLoadImage(url: URL?, complition: @escaping ((UIImage) -> Void)) {
        guard let url = url else {
            return
        }
        
        let downLoad = DispatchWorkItem(qos: .userInitiated) {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        complition(image)
                    }
                }
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async(execute: downLoad)
        self.download = downLoad
    }
    
    
    func cancel() {
        download?.cancel()
        download = nil
    }
}
