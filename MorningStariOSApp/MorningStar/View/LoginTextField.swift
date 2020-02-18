//
//  LoginTextField.swift
//  MorningStar
//
//  Created by Yoahn Linard on 28/11/2019.
//  Copyright © 2019 Yoahn Linard. All rights reserved.
//

import UIKit

@IBDesignable
class LoginTextField: UITextField
{
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
       super.awakeFromNib()
        self.initUI()
    }
    func initUI()
    {
        self.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.layer.borderWidth = 1
        self.setLeftPaddingPoints(10)
        
    }
}
