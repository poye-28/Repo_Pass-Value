//
//  MyTableViewCell.swift
//  PassValue
//
//  Created by POYEH on 2020/1/16.
//  Copyright © 2020 POYEH. All rights reserved.
//

import UIKit

protocol MyTableviewCellDelegate: AnyObject {
    
    func rowOfDeletedCell(row: Int)
    
}

class MyTableViewCell: UITableViewCell {
    
    weak var delegate: MyTableviewCellDelegate?
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    var deleteHandler: ((Int) -> Void)?
    
//    @IBAction func deleteAction(_ sender: UIButton) {
//
//        deleteHandler?(sender.tag)
//
//    }
    
    
    @IBAction func deleteAction(_ sender: UIButton) {
        
        delegate?.rowOfDeletedCell(row: sender.tag)
        
    }
    
}
