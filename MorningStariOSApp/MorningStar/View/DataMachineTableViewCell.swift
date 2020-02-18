//
//  DataMachineTableViewCell.swift
//  MorningStar
//
//  Created by Guillaume Djaider Fornari on 15/02/2020.
//  Copyright © 2020 Yoahn Linard. All rights reserved.
//

import UIKit

class DataMachineTableViewCell: UITableViewCell {

    @IBOutlet weak var dataRepetion: UILabel!
    @IBOutlet weak var dataPoids: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContent(dataRepetion: String, dataPoids: String) {
        self.dataRepetion.text = dataRepetion
        self.dataPoids.text = dataPoids
    }
}
