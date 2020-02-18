//
//  ChatBotViewCell.swift
//  MorningStar
//
//  Created by Guillaume Djaider Fornari on 12/12/2019.
//  Copyright © 2019 Yoahn Linard. All rights reserved.
//

import UIKit

class ChatBotViewCell: UITableViewCell {

    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setContent(content: String) {
        self.content.text = content
    }
}
