//
//  UITableView+Extensions.swift
//  Glontact
//
//  Created by Lucas Farah on 02/03/23.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(type: T.Type) {
        self.register(type, forCellReuseIdentifier: NSStringFromClass(type))
    }
    
    func dequeueReusableCell<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: NSStringFromClass(type), for: indexPath) as? T else {
            preconditionFailure("Cell not registered")
        }
        return cell
    }
}
