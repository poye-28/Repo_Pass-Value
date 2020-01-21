//
//  ViewController.swift
//  PassValue
//
//  Created by POYEH on 2020/1/16.
//  Copyright © 2020 POYEH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ScVc = SecondViewController()
    
    var rowSelected = Int()
    
    @IBOutlet weak var tableview: UITableView!
    
    var myArray: [String] = ["2" ,"3" ,"4" ,"5"]
    
    var mycell = MyTableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        
        tableview.dataSource = self
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is SecondViewController {
            
            let vc = segue.destination as? SecondViewController
            
            guard let text = sender as? String else { return }
            
            vc?.labelText = text
            
        }
        
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MyTableViewCell
 
/* Closure */
//        cell.deleteHandler = { [weak self] (row) in
//
//            self?.myArray.remove(at: row)
//
//            self?.tableview.reloadData()
//
//        }
        
//        cell.deleteButton.addTarget(self, action: #selector(deleteText(_:)), for: .touchUpInside)]
        
        SecondViewController().updateHandler = { [weak self] (newText) in
            
            guard let index = self?.rowSelected else { return }
            
            self?.myArray[index] = newText
            
            self?.tableview.reloadData()
        }
        
        cell.delegate = self
        
        cell.label.text = myArray[indexPath.row]
        
        cell.deleteButton.tag = indexPath.row
        
        return cell
        
    }
    
    /* AddTarget part */
//    @objc func deleteText(_ sender: UIButton) {
//
//        self.myArray.remove(at: sender.tag)
//
//        self.tableview.reloadData()
//
//    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "changeText", sender: myArray[indexPath.row])
        
        rowSelected = indexPath.row
        
    }

}

extension ViewController: MyTableviewCellDelegate {
    
    func rowOfDeletedCell(row: Int) {
        
        self.myArray.remove(at: row)
        
        self.tableview.reloadData()
        
    }
    
}

