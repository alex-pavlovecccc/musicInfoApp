//
//  UITableView + Ex.swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 27.06.2022.
//

import UIKit

extension UITableView {
    func dequeueReusableCells<CellType: UITableViewCell>(type: CellType.Type, indexPath: IndexPath) -> CellType {
        return self.dequeueReusableCell(withIdentifier: "\(CellType.self)", for: indexPath) as! CellType
    }
}
