//
//  UIViewController+RegisterNibs.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 06..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import Foundation
import UIKit

/**
 Protocol for use collection view in implementation
 */
protocol CollectionViewNibRegistration {
    
    var collectionView: UICollectionView! { get set }
    
}

/**
 Protocol for use table view in implementation
 */
protocol TableViewNibRegistration {
    
    var tableView: UITableView! { get set }
    
}

/**
 Extension for CollectionViewNibRegistration.
 Methods for register nibs...
 */
extension CollectionViewNibRegistration {
    
    /**
     Registrate a nib for collection view.
     - parameter nibName: The name of the Nib, what you want to  use.
     - parameter cellName: The identifier of the Cell, what you want to  use.
     */
    func registerCollectionViewNibs(nibName: String, cellName: String? = nil) {
        let cellNib = UINib(nibName: nibName, bundle: nil)
        if cellName != nil {
            self.collectionView.register(cellNib, forCellWithReuseIdentifier: cellName!)
        } else {
            self.collectionView.register(cellNib, forCellWithReuseIdentifier: nibName)
        }
    }
    
}

/**
 Extension for TableViewNibRegistration.
 Methods for register nibs...
 */
extension TableViewNibRegistration {
    
    /**
     Registrate a nib for collection view.
     - parameter nibName: The name of the Nib, what you want to  use.
     - parameter cellName: The identifier of the Cell, what you want to  use.
     */
    func registerTableViewNibs(nibName: String, cellName: String? = nil) {
        let cellNib = UINib(nibName: nibName, bundle: nil)
        if cellName != nil {
            self.tableView.register(cellNib, forCellReuseIdentifier: cellName!)
        } else {
            self.tableView.register(cellNib, forCellReuseIdentifier: nibName)
        }
    }
    
}
