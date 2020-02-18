//
//  CurrentDataMachineTableViewCell.swift
//  MorningStar
//
//  Created by Guillaume Djaider Fornari on 15/02/2020.
//  Copyright © 2020 Yoahn Linard. All rights reserved.
//

import UIKit

class CurrentDataMachineTableViewCell: UITableViewCell {

    @IBOutlet weak var currentDataRepetition: UILabel!
    @IBOutlet weak var currentDataPoids: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContent(dataRepetion: String, dataPoids: String) {
        self.currentDataRepetition.text = dataRepetion
        self.currentDataPoids.text = dataPoids
    }
    
}
