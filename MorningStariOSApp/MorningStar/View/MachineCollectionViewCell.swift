//
//  MachineCollectionViewCell.swift
//  MorningStar
//
//  Created by Guillaume Djaider Fornari on 15/02/2020.
//  Copyright © 2020 Yoahn Linard. All rights reserved.
//

import UIKit

class MachineCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameMachine: UILabel!
    
    var data: [(String, String)] = [("", "")]
    
    func setMachine(data: (String, [(String, String)])) {
        self.data = data.1
        self.nameMachine.text =  data.0
    }
}

extension MachineCollectionViewCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DataMachineTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DataMachineCell") as! DataMachineTableViewCell
        cell.setContent(dataRepetion: data[indexPath.row].0, dataPoids: data[indexPath.row].1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 81
    }
}
