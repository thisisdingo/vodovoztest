//
//  ViewController.swift
//  VodovozTest
//
//  Created by Mister Gamburger on 21/06/2019.
//  Copyright © 2019 Mister Gamburger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    
    var cells : [ProductModel] = [
        ProductModel(id: 0, name: "Вода", count: 1, price: 100, discountPercent: Int.random(in: 0..<10)),
        ProductModel(id: 0, name: "Еда", count: 4, price: 80, discountPercent: Int.random(in: 0..<10)),
        ProductModel(id: 0, name: "Что то еше", count: 2, price: 150, discountPercent: Int.random(in: 0..<10))
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "VodovozTableViewCell", bundle: nil), forCellReuseIdentifier: "VodovozTableViewCell")
        
        
    }
    
    @objc func didDiscountTapped(_ sender : UIButton){
        let index = sender.tag
        
        cells[index].discountPercent = Int.random(in: 0..<10)
        
        self.tableView.reloadData()
        
    }
}

extension ViewController : UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let index = textField.tag
        
        
        
        let formattedCount = Int(textField.text ?? "1") ?? 1
        cells[index].count = formattedCount
        self.tableView.reloadData()

        return true
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VodovozTableViewCell") as! VodovozTableViewCell
        
        cell.setProduct(cells[indexPath.row])
        
        cell.countField.tag = indexPath.row
        cell.countField.delegate = self
        cell.discountPercent.tag = indexPath.row
        cell.discountPercent.addTarget(self, action: #selector(didDiscountTapped(_ :)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.tableView.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}

